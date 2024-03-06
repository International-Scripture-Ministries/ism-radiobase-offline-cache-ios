//
//  BibleDataFromDB.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 11/04/2022.
//

import Foundation
import ObjectMapper
import RealmSwift

protocol BibleDataManagerRepresentable {
    func setupPrepopulatedDB() -> Bool
    func getAllBooks() -> [String:Any]
    func getVerses(bookId: String, bibleId: String, chapterNumber: Int) -> Array<[String:Any]>
    func getBookTeaching(bookId: String) -> Array<[String:Any]>
    func getTeaching(bookId: String, teachingUUID: String) -> [String:Any]
    func getTeachings(bookId: String) -> Array<[String:Any]>
    func getTotalDownloads() -> Array<[String:Any]>
    func getDownloadList(bookId: String, fileType: String) -> Array<[String:Any]> // fileType --> chapter/teaching
    func getPercentage(bookId: String, fileType: String) -> [String:Any] // fileType --> chapter/teaching
    func getBookPercentage(fileType: String) -> Array<[String:Any]> // fileType --> chapter/teaching
    func updateDownload(fileName: String, localPath: String) -> [String:Any]  // file_name format {{bookID_type_UUID/CHAP}} example: GEN_chapter_5    OR   GEN_teaching_678687-798798-890. local_path will be the audio_path
    func deleteDownloads(bookId: String, fileType: String, chapterDownloads: Bool, studyDownloads: Bool) -> [String:Any]  // fileType --> single/all
    func delete(bookId: String, fileType: String, chapterNumber: String, uuid: String) -> [String:Any]
    func getBookDownloads(bookId: String) -> [String:Any]
}

class BibleDataManager: BibleDataManagerRepresentable {
    
    static let shared: BibleDataManagerRepresentable = BibleDataManager()
    private let defaults = UserDefaults.standard
    private let fileManager = FileManager.default
    private var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    private var realm: Realm!
    private var uniqueTeachings = [Teaching]()
    
    init() { }

    func setupPrepopulatedDB() -> Bool {
        
        if self.defaults.bool(forKey: Constants.isPrepopulatedDBExtracted) {
            print("-----------")
            print("Pre-populated DB PATH: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
            print("-----------")
            self.realm = try! Realm()
            self.loadUniqueTeachings()
            return true
        }
        
        guard let defaultPath = Realm.Configuration.defaultConfiguration.fileURL?.path else {
            fatalError("Can not get default path of Realm to copy db.")
        }
        let path = self.bundle.path(forResource: "default", ofType: "realm")
        
//        if self.fileManager.fileExists(atPath: defaultPath) {
//            try? self.fileManager.removeItem(atPath: defaultPath)
//            let realLockPath = defaultPath + ".lock"
//            if self.fileManager.fileExists(atPath: realLockPath) {
//                try? self.fileManager.removeItem(atPath: realLockPath)
//            }
//        }
        
        if !self.fileManager.fileExists(atPath: defaultPath),
           let bundledPath = path {
            do {
                try self.fileManager.copyItem(atPath: bundledPath, toPath: defaultPath)
                self.defaults.set(true, forKey: Constants.isPrepopulatedDBExtracted)
                print("-----------")
                print("Pre-populated DB PATH: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
                print("-----------")
                self.realm = try! Realm()
                self.loadUniqueTeachings()
                return true
            } catch {
                fatalError("Error copying pre-populated Realm \(error)")
            }
        }

        fatalError("Another Realm file exists already.")
    }
    
    private func loadUniqueTeachings() {

        let teachings = realm.objects(Teaching.self)
        //  Remove duplicated teachings
        teachings.forEach { teaching in
            if !uniqueTeachings.contains(where: { uTeaching in
                return uTeaching.uuid == teaching.uuid
            }) {
                uniqueTeachings.append(teaching)
            }
        }
    }
    
    func getAllBooks() -> [String:Any] {
        
        let books = realm.objects(Book.self)
        print("Books Stored count: \(books.count)")
        
        //  Old
        let oldBooks = books.filter { Constants.oldBookIds.contains($0.id.lowercased()) }
        var oldBooksJSON = Array<[String:Any]>()
        oldBooks.forEach{oldBooksJSON.append($0.toJsonForGetAllBooks())}

        //  New
        let newBooks = books.filter { Constants.newBookIds.contains($0.id.lowercased()) }
        var newBooksJSON = Array<[String:Any]>()
        newBooks.forEach{newBooksJSON.append($0.toJsonForGetAllBooks())}

        //  JSON for old and new
        var dicto = [String:Any]()
        dicto["old_testament"] = oldBooksJSON
        dicto["new_testament"] = newBooksJSON
        return dicto
    }
    
    func getVerses(bookId: String, bibleId: String, chapterNumber: Int) -> Array<[String:Any]> {
        let verses = realm.objects(Verse.self).filter({ verse in
            return verse.bookId == bookId &&
                   verse.bibleId == bibleId &&
                   verse.chapterNumber == chapterNumber
        })
        var jsons = Array<[String:Any]>()
        verses.forEach{
            jsons.append($0.toJson())
        }
        return jsons
    }
    
    func getBookTeaching(bookId: String) -> Array<[String:Any]> {
        let teachings = uniqueTeachings.filter { teaching in
            return teaching.bookId == bookId
        }
        var jsons = Array<[String:Any]>()
        teachings.forEach{
            jsons.append($0.toJson())
        }
        return jsons
    }
    
    func getTeaching(bookId: String, teachingUUID: String) -> [String:Any] {
        
        let teaching = uniqueTeachings.first { teaching in
            return teaching.bookId == bookId && teaching.uuid == teachingUUID
        }
        guard let teaching = teaching else {
            return [String:Any]()
        }
        let json = teaching.toJson()
        return json
    }
    
    func getTeachings(bookId: String) -> Array<[String:Any]> {
        let teachings = uniqueTeachings.filter { teaching in
            return teaching.bookId == bookId
        }
        var jsons = Array<[String:Any]>()
        teachings.forEach{
            jsons.append($0.toGetTeachingsJson())
        }
        return jsons
    }
    
    func getTotalDownloads() -> Array<[String:Any]> {
        let chapterAudios = realm.objects(Audio.self)
        let books = realm.objects(Book.self).filter({ book in
            let isChapterAudioDownloaded = chapterAudios.contains { audio in
                return audio.bookId == book.id && !audio.audio_path.isEmpty
            }
            let isTeachingAudioDownloaded = self.uniqueTeachings.contains { teaching in
                return teaching.bookId.uppercased() == book.id && !teaching.audio_path.isEmpty
            }
            return isChapterAudioDownloaded || isTeachingAudioDownloaded
        })
        var jsons = Array<[String:Any]>()
        books.forEach{
            jsons.append($0.toTotalDownloadsJson())
        }
        return jsons
    }
    
    func getDownloadList(bookId: String, fileType: String) -> Array<[String:Any]> {
        var jsons = Array<[String:Any]>()
        if fileType == "chapter" {
            let chapterAudios = realm.objects(Audio.self).filter { audio in
                return audio.bookId == bookId && audio.audio_path.isEmpty
            }
            chapterAudios.forEach{
                jsons.append($0.toGetDownloadListJson())
            }
        } else if fileType == "teaching" {
            let teachings = uniqueTeachings.filter { teaching in
                return teaching.bookId == bookId && teaching.audio_path.isEmpty
            }
            teachings.forEach{
                jsons.append($0.toGetDownloadListJson())
            }
        }
        return jsons
    }
    
    func getPercentage(bookId: String, fileType: String) -> [String:Any] {
        var json = ["message": "success",
                    "status": "true"]
        if fileType == "chapter" {
            let chapterAudios = realm.objects(Audio.self).filter { audio in
                return audio.bookId == bookId
            }
            let downloaded = chapterAudios.filter { item in
                return !item.audio_path.isEmpty
            }
            if chapterAudios.isEmpty {
                json["download_percentage"] = "0"
                json["download_status"] = "NULL"
            } else {
                let totalCount = Double(chapterAudios.count)
                let downloadedCount = Double(downloaded.count)
                let percentage = Int(downloadedCount / totalCount * 100)
                json["download_percentage"] = "\(percentage)"
                if percentage == 0 {
                    json["download_status"] = "NULL"
                } else if percentage == 100 {
                    json["download_status"] = "COMPLETED"
                } else {
                    json["download_status"] = "PENDING"
                }
            }
        } else if fileType == "teaching" {
            
            let teachings = uniqueTeachings.filter { teaching in
                return teaching.bookId == bookId
            }
            let downloaded = teachings.filter { item in
                return !item.audio_path.isEmpty
            }

            if teachings.isEmpty {
                json["download_percentage"] = "0"
                json["download_status"] = "NULL"
            } else {
                let totalCount = Double(teachings.count)
                let downloadedCount = Double(downloaded.count)
                let percentage = Int(downloadedCount / totalCount * 100)
                json["download_percentage"] = "\(percentage)"
                if percentage == 0 {
                    json["download_status"] = "NULL"
                } else if percentage == 100 {
                    json["download_status"] = "COMPLETED"
                } else {
                    json["download_status"] = "PENDING"
                }
            }
        }
        return json
    }
    
    func getBookPercentage(fileType: String) -> Array<[String:Any]> {
        var jsons = Array<[String:Any]>()
        let chapterAudios = realm.objects(Audio.self)

        let books = realm.objects(Book.self)
        books.forEach({ book in
            if fileType == "chapter" {
                let total = chapterAudios.filter { item in
                    return item.bookId == book.id
                }
                let downloaded = total.filter { item in
                    return !item.audio_path.isEmpty
                }
                var json = ["book_id": book.id]
                if total.isEmpty {
                    json["download_percentage"] = "0"
                    json["download_status"] = "NULL"
                } else {
                    let totalCount = Double(total.count)
                    let downloadedCount = Double(downloaded.count)
                    let percentage = Int(downloadedCount / totalCount * 100)
                    json["download_percentage"] = "\(percentage)"
                    if percentage == 0 {
                        json["download_status"] = "NULL"
                    } else if percentage == 100 {
                        json["download_status"] = "COMPLETED"
                    } else {
                        json["download_status"] = "PENDING"
                    }
                }
                jsons.append(json)
            } else if fileType == "teaching" {
                let total = uniqueTeachings.filter { item in
                    return item.bookId.uppercased() == book.id
                }
                let downloaded = total.filter { item in
                    return !item.audio_path.isEmpty
                }
                var json = ["book_id": book.id]
                if total.isEmpty {
                    json["download_percentage"] = "0"
                    json["download_status"] = "NULL"
                } else {
                    let totalCount = Double(total.count)
                    let downloadedCount = Double(downloaded.count)
                    let percentage = Int(downloadedCount / totalCount * 100)
                    json["download_percentage"] = "\(percentage)"
                    if percentage == 0 {
                        json["download_status"] = "NULL"
                    } else if percentage == 100 {
                        json["download_status"] = "COMPLETED"
                    } else {
                        json["download_status"] = "PENDING"
                    }
                }
                jsons.append(json)
            }
        })
        return jsons
    }
    
    func updateDownload(fileName: String, localPath: String) -> [String:Any] {
        var json = [String:Any]()
        let components = fileName.components(separatedBy: ".").first?.components(separatedBy: "_") ?? []
        if components.count != 3 { return json }
        let bookID = components[0] 
        let type = components[1]
        let chapterOrUUID = components[2]
        if type == "chapter" {
            realm.objects(Audio.self).forEach({ audio in
                if audio.bookId == bookID && audio.number == chapterOrUUID {
                    try! self.realm.write {
                        audio.audio_path = localPath
                    }
                }
            })
        } else if type == "teaching" {
            realm.objects(Teaching.self).forEach({ teaching in
                if teaching.bookId.uppercased() == bookID && teaching.uuid == chapterOrUUID {
                    try! self.realm.write {
                        teaching.audio_path = localPath
                    }
                }
            })
        }
        json = ["message": "success",
                "status": "true"]
        return json
    }
    
    func deleteDownloads(bookId: String, fileType: String, chapterDownloads: Bool, studyDownloads: Bool) -> [String:Any] {

        var json = [String:Any]()
        if fileType == "single" {
            if chapterDownloads {
                let downloaded = realm.objects(Audio.self).filter { item in
                    return !item.audio_path.isEmpty
                }
                downloaded.forEach({ item in
                    if item.bookId == bookId {
                        try! self.realm.write {
                            item.audio_path = ""
                        }
                    }
                })
            }
            if studyDownloads {
                let downloaded = realm.objects(Teaching.self).filter { item in
                    return !item.audio_path.isEmpty
                }
                downloaded.forEach({ item in
                    if item.bookId == bookId {
                        try! self.realm.write {
                            item.audio_path = ""
                        }
                    }
                })
            }
        } else if fileType == "all" {
            if chapterDownloads {
                let downloaded = realm.objects(Audio.self).filter { item in
                    return !item.audio_path.isEmpty
                }
                downloaded.forEach({ item in
                    try! self.realm.write {
                        item.audio_path = ""
                    }
                })
            }
            if studyDownloads {
                let downloaded = realm.objects(Teaching.self).filter { item in
                    return !item.audio_path.isEmpty
                }
                downloaded.forEach({ item in
                    try! self.realm.write {
                        item.audio_path = ""
                    }
                })
            }
        }
        json = ["message": "success",
                "status": "true"]
        return json
    }
    
    func delete(bookId: String, fileType: String, chapterNumber: String, uuid: String) -> [String:Any] {
        
        var json = [String:Any]()
        if fileType == "chapter" {
            realm.objects(Audio.self).forEach({ audio in
                if audio.bookId == bookId && audio.number == chapterNumber {
                    try! self.realm.write {
                        audio.audio_path = ""
                    }
                }
            })
        } else if fileType == "teaching" {
            let teachings = realm.objects(Teaching.self).filter { teaching in
                return teaching.bookId.uppercased() == bookId && teaching.uuid == uuid && !teaching.audio_path.isEmpty
            }
            teachings.forEach({ teaching in
                try! self.realm.write {
                    teaching.audio_path = ""
                }
            })
        }
        json = ["message": "success",
                "status": "true"]
        return json
    }
    
    func getBookDownloads(bookId: String) -> [String:Any] {
        
        let start = Date()
        print("Start Time: \(start)")

        var json = [String:Any]()
        var chaptersJsons = Array<[String:Any]>()
        var teachingsJsons = Array<[String:Any]>()

        realm.objects(Audio.self).forEach({ audio in
            if audio.bookId == bookId && !audio.audio_path.isEmpty {
                chaptersJsons.append(audio.toGetBookDownloadsJson())
            }
        })

        uniqueTeachings.forEach({ teaching in
            if teaching.bookId.uppercased() == bookId && !teaching.audio_path.isEmpty {
                teachingsJsons.append(teaching.toGetBookDownloadsJson())
            }
        })

        json = ["chapter": chaptersJsons,
                "teaching": teachingsJsons]
        
        let end = Date()
        print("End Time: \(end)")
        print("Difference: \(end.timeIntervalSince(start)) seconds")

        return json
    }
}


//  MARK: DB Creation

extension BibleDataManager {
    
    func createdRealmDatabase() {
        
        let start = Date()
        print("Create DB from local JSON files --> Started")
        print("Start Time: \(start)")
        self.createBooksInDB()
        let end = Date()
        print("Create DB from local JSON files --> Completed")
        print("End Time: \(end)")
        print("Difference: \(end.timeIntervalSince(start)) seconds")
        
        print("-----------")
        print("DB PATH: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        print("-----------")
    }
    
    func createBooksInDB() {
        
        self.realm = try! Realm()
        if let path = self.bundle.path(forResource: Constants.booksJsonFileName, ofType: "json") {
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                print("Unable to find file in bundle resources")
                return
            }
            
            guard let booksJson = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Array<[String:Any]> else {
                print("Unable to get JSON from file \(Constants.booksJsonFileName).json")
                print("Unable to get books json array")
                return
            }
            
            let books: [Book] = Mapper<Book>().mapArray(JSONArray: booksJson)
            print("-----------")
            print("books count: \(books.count)")
            print("-----------")
            
            print("Writting books -- Started")
            books.forEach { book in
                try! realm.write {
                    realm.add(book)
                }
            }
            print("Writting books -- Completed")
            
            let verseFileNames = books.map { $0.id }
            let audioFileNames = books.map { Constants.audiosJsonFilePrefix + $0.id }
            let extraTeachings = books.map { Constants.extraTeachingsJsonFilePrefix + $0.id }

            self.createVersesInDB(files: verseFileNames)
            self.createAudiosInDB(files: audioFileNames)
            self.addRemainingTeachingsInDB(files: extraTeachings)
        }
    }
    
    //    func addHardcodedTeachingInDB(files: [String]) {
    //
    //        print("-----------")
    //        print("Total hardcoded Json files count: \(files.count)")
    //        print("-----------")
    //
    //        files.forEach { name in
    //            if let path = self.bundle.path(forResource: name, ofType: "json") {
    //                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
    //                    print("Unable to find file in bundle resources")
    //                    return
    //                }
    //                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String:Any] else {
    //                    print("Unable to get JSON from file \(name).json")
    //                    return
    //                }
    //
    //                guard let teachingJson = jsonObject as? [String:Any] else {
    //                    print("Unable to get verses json array")
    //                    return
    //                }
    //                if let teaching: Teaching = Mapper<Teaching>().map(JSON: teachingJson) {
    //                    print("Writting Teaching for \(teaching.uuid) -- Started")
    //                    try! realm.write {
    //                        realm.add(teaching)
    //                    }
    //                    print("Writting Teaching \(teaching.uuid) -- Completed")
    //                }
    //            }
    //        }
    //    }
    
    func createVersesInDB(files: [String]) {
        
        print("-----------")
        print("Total Verse Json files count: \(files.count)")
        print("-----------")
        
        files.forEach { name in
            if let path = self.bundle.path(forResource: name, ofType: "json") {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                    print("Unable to find file in bundle resources")
                    return
                }
                guard let versesJson = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Array<[String:Any]> else {
                    print("Unable to get JSON from file \(name).json")
                    print("Unable to get verses json array")
                    return
                }
                
                let verses: [Verse] = Mapper<Verse>().mapArray(JSONArray: versesJson)
                print("-----------")
                print("Verses count: \(verses.count)")
                print("-----------")
                
                print("Writting Verses for \(name) -- Started")
                verses.forEach { verse in
                    try! realm.write {
                        realm.add(verse)
                    }
                }
                print("Writting Verses \(name) -- Completed")
            }
        }
    }
    
    func createAudiosInDB(files: [String]) {
        
        print("-----------")
        print("Total Audio Json files count: \(files.count)")
        print("-----------")
        
        
        files.forEach { name in
            if let path = self.bundle.path(forResource: name, ofType: "json") {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                    print("Unable to find file in bundle resources")
                    return
                }
                guard let audiosJson = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Array<[String:Any]> else {
                    print("Unable to get JSON from file \(name).json")
                    print("Unable to get audios json array")
                    return
                }
                
                let audios: [Audio] = Mapper<Audio>().mapArray(JSONArray: audiosJson)
                print("-----------")
                print("Audios count: \(audios.count)")
                print("-----------")
                
                print("Writting Audios for \(name) -- Started")
                audios.forEach { audio in
                    try! realm.write {
                        realm.add(audio)
                    }
                }
                print("Writting Audios for \(name) -- Completed")
            }
        }
    }
    
    func addRemainingTeachingsInDB(files: [String]) {
        
        print("-----------")
        print("Total extra teachings Json files count: \(files.count)")
        print("-----------")
        
        
        files.forEach { name in
            if let path = self.bundle.path(forResource: name, ofType: "json") {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                    print("Unable to find file in bundle resources")
                    return
                }
                guard let teachingsJson = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Array<[String:Any]> else {
                    print("Unable to get JSON from file \(name).json")
                    print("Unable to get teachings json array")
                    return
                }

                let teachings: [Teaching] = Mapper<Teaching>().mapArray(JSONArray: teachingsJson)
                let alreadySavedTeachings = self.realm.objects(Teaching.self)
                print("-----------")
                print("teachings count: \(teachings.count) for file: \(name)")
                print("alreadySavedTeachings count: \(alreadySavedTeachings.count)")
                print("-----------")

                
                print("Writting teachings for \(name) -- Started")
                teachings.forEach { teaching in
                    let isAlreadySaved = alreadySavedTeachings.contains { alreadySavedTeaching in
                        alreadySavedTeaching.uuid == teaching.uuid
                    }
                    if !isAlreadySaved {
                        try! realm.write {
                            realm.add(teaching)
                            print("adding a new entry for file \(name) with uuid: \(teaching.uuid)")
                        }
                    }
                }
                print("Writting extra teachings for \(name) -- Completed")
            }
        }
    }
}

extension Array where Element: Teaching {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            result.contains { element in
                return element.uuid == value.uuid
            }
        }

        return result
    }
}
