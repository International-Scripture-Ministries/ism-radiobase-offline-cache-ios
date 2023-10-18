//
//  BibleDataFromDB.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 11/04/2022.
//

import Foundation
import ObjectMapper
import RealmSwift

class BibleDataManager {
    
    // MARK: Public

    static let shared = BibleDataManager()

    func configureDatabase() {
        
        //  DocumentsManager.shared.clearAllMediaFiles()
        
        if !hasBooksInDB {
            print("Dumping DB from local JSON files")
            dumpDBFromJSONFiles()
            print("dumpDBFromJSONFiles --> Done")
        }
        startDownloadingMediaFiles()
    }

    // MARK: Private

    private var realm: Realm!
    private let reachability = try! Reachability()
    private var isDownloadingInProgress = false
    private let bookIDsToDownloadTeachings = ["John", "Matthew", "Luke", "Mark"]

    private init() {
        realm = try! Realm()
    }

    private var hasBooksInDB: Bool {
        let books = realm.objects(Book.self)
        return !books.isEmpty
    }
    
    private func dumpDBFromJSONFiles() {
        let files = ["1chr",
                     "1cor",
                     "1john",
                     "1kgs",
                     "1pet",
                     "1sam",
                     "1thess",
                     "1tim",
                     "2chr",
                     "2cor",
                     "2john",
                     "2kgs",
                     "2pet",
                     "2sam",
                     "2thess",
                     "2tim",
                     "3john",
                     "acts",
                     "amos",
                     "col",
                     "dan",
                     "deut",
                     "eccl",
                     "eph",
                     "esth",
                     "exod",
                     "ezek",
                     "ezra",
                     "gal",
                     "gen",
                     "hab",
                     "hag",
                     "heb",
                     "hos",
                     "isa",
                     "jas",
                     "jer",
                     "job",
                     "joel",
                     "john",
                     "jonah",
                     "josh",
                     "jude",
                     "judg",
                     "lam",
                     "lev",
                     "luke",
                     "mal",
                     "mark",
                     "matt",
                     "mic",
                     "nah",
                     "neh",
                     "num",
                     "obad",
                     "phil",
                     "phlm",
                     "prov",
                     "ps",
                     "rev",
                     "rom",
                     "ruth",
                     "song",
                     "titus",
                     "zech",
                     "zeph"
        ]
        files.forEach{dumpDBFromJSONFile(name: $0)}
    }
    
    private func dumpDBFromJSONFile(name: String) {
        
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                print("Unable to find file \(name).json in local directory")
                return
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
                print("Unable to get JSON from file \(name).json")
                return
            }
            guard let book = Mapper<Book>().map(JSONObject: jsonObject) else {
                print("Unable to parse Book from file \(name).json")
                return
            }
            
            print("-----------")
            print("name: \(name)")
            print("book.book_id: \(book.book_id)")
            print("book.book_name: \(book.book_name)")
            print("-----------")

            try! realm.write {
                realm.add(book)
            }
        }
    }
    
    private func startDownloadingMediaFiles() {
        
        do {
            try reachability.startNotifier()
            print("reachability.startNotifier()")
        } catch {
            print("Unable to start reachability")
        }

        downloadNextVersesMediaFiles()

        reachability.whenReachable = { [weak self] reachability in
            guard let self = self else { return }
            print("Internet Reachable")
            print("isDownloadingMediaFileInProgress: \(self.isDownloadingInProgress)")
            if self.isDownloadingInProgress { return }
            self.downloadNextVersesMediaFiles()
        }
        reachability.whenUnreachable = { [weak self] _ in
            guard let self = self else { return }
            print("Internet Not Reachable")
            self.isDownloadingInProgress = false
        }
    }
    
    private func downloadNextVersesMediaFiles() {
        isDownloadingInProgress = true
        let verse = realm.objects(Verse.self).first { verse in
            if bookIDsToDownloadTeachings.contains(verse.book_id) {
                print("verse.book_id : \(verse.book_id)")
                return verse.teaching_audio.containsHTTP || verse.teachings_badge_image.containsHTTP
            }
            return false
        }
        guard let verse = verse else {
            print("verse with https teaching_audio not found in database")
            print("all verses teaching_audio files are downloaded already")
            return
        }
        downloadMedia(verse: verse)
    }
    
    private func downloadMedia(verse: Verse) {
        if verse.teaching_audio.containsHTTP {
            print("teaching_audio to download from url: \(verse.compressedTeachingAudioURL)")
            verse.currentDownloadingContentType = .teachingAudio
            NetworkManager.shared.startDownloadingMedia(verse: verse) { [weak self] in
                guard let self = self else { return }
                try! self.realm.write {
                    verse.teaching_audio = verse.localRelativePathTeachingAudio
                }
                self.downloadMedia(verse: verse)
            }
        }
        else if verse.teachings_badge_image.containsHTTP {
            print("teachings_badge_image to download from url: \(verse.teachings_badge_image)")
            verse.currentDownloadingContentType = .teachingsBadgeImage
            NetworkManager.shared.startDownloadingMedia(verse: verse) { [weak self] in
                guard let self = self else { return }
                try! self.realm.write {
                    verse.teachings_badge_image = verse.localRelativePathTeachingsBadgeImage
                }
                verse.currentDownloadingContentType = .none
                self.downloadMedia(verse: verse)
            }
        }
        else {
            print("verse.teachings_badge_image: \(verse.teachings_badge_image)")
            print("verse.teaching_audio: \(verse.teaching_audio)")
            downloadNextVersesMediaFiles()
        }
    }
}


extension BibleDataManager {

    func getAllBooks() -> [String:Any] {
        let books = realm.objects(Book.self)
        print("Books Stored count: \(books.count)")
        
        //  Old
        let oldTestamentBooks = books.filter{$0.isOldTestament}
        var oldTestamentBooksJSON = Array<[String:Any]>()
        oldTestamentBooks.forEach{oldTestamentBooksJSON.append($0.toJSONGetAllBooks())}

        //  New
        let newTestamentBooks = books.filter{!$0.isOldTestament}
        var newTestamentBooksJSON = Array<[String:Any]>()
        newTestamentBooks.forEach{newTestamentBooksJSON.append($0.toJSONGetAllBooks())}

        //  JSON for old and new
        var dicto = [String:Any]()
        dicto["old_testament"] = oldTestamentBooksJSON
        dicto["new_testament"] = newTestamentBooksJSON
        return dicto
    }

    func getBibleData(book_id: String) -> Array<[String:Any]> {
        let book = realm.objects(Book.self).first { book in
            return book.book_id == book_id
        }
        guard let book = book else { return Array<[String:Any]>() }
        let json = book.toJSON()
        return [json]
    }

    func getBookTeaching(book_id: String) -> Array<[String:Any]> {
        let book = realm.objects(Book.self).first { book in
            return book.book_id == book_id
        }
        guard let book = book else { return Array<[String:Any]>() }
        let chaptersList = book.chapters_list
        let allVerses = chaptersList.compactMap{$0.verses}.reduce([], +)
        let teachingAudios = allVerses.compactMap{$0.teaching_audio}
        let uniqueTeachingAudios = Array(Set(teachingAudios))
        var uniqueVerses = [Verse]()
        uniqueTeachingAudios.forEach { teachingAudio in
            let verse = allVerses.first{$0.teaching_audio == teachingAudio}
            if let verse = verse {
                uniqueVerses.append(verse)
            }
        }
        var jsons = Array<[String:Any]>()
        uniqueVerses.forEach{
            jsons.append($0.toJSONGetBookTeachingByBookID())
        }
        return jsons
    }

    func getBookTeaching(book_id: String, teaching_id: String) -> [String:Any] {
        let book = realm.objects(Book.self).first { book in
            return book.book_id == book_id
        }
        guard let book = book else { return [String:Any]() }
        let chaptersList = book.chapters_list
        let allVerses = chaptersList.compactMap{$0.verses}.reduce([], +)
        let verse = allVerses.first { verse in
            return verse.teaching_id == teaching_id
        }
        guard let verse = verse else { return [String:Any]() }
        let json = verse.toJSONGetBookTeachingByBookID()
        return json
    }
}
