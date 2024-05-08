import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(OfflineDBPlugin)
public class OfflineDBPlugin: CAPPlugin {
    
    public override func load() {
        _ = BibleDataManager.shared.setupPrepopulatedDB()
    }
    
    @objc func echo(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        call.resolve()
    }
    
    @objc func getAllBooks(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        let json = BibleDataManager.shared.getAllBooks()
        call.resolve(json)
    }
    
    @objc func getVerses(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("bookId") else {
            call.reject("bookId should be string and can not be nil")
            return
        }
        guard let bibleId = call.getString("bibleId") else {
            call.reject("bibleId should be string and can not be nil")
            return
        }
        guard let chapterNumber = call.getInt("chapterNumber") else {
            call.reject("chapterNumber should be Int and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getVerses(bookId: bookID, bibleId: bibleId, chapterNumber: chapterNumber)
        call.resolve(["result": json])
    }
    
    @objc func getBookTeaching(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getBookTeaching(bookId: bookID)
        call.resolve(["result": json])
    }

    @objc func getTeachings(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bibleBook = call.getString("bible_book") else {
            call.reject("bible_book should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getTeachings(bookId: bibleBook)
        call.resolve(["result": json])
    }
    
    @objc func getTeaching(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        guard let teachingUUID = call.getString("teaching_uuid") else {
            call.reject("teaching_uuid should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getTeaching(bookId: bookID, teachingUUID: teachingUUID)
        call.resolve(["result": json])
    }
    
    @objc func getTotalDownloads(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        let json = BibleDataManager.shared.getTotalDownloads()
        call.resolve(["result": json])
    }
    
    @objc func getDownloadList(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        guard let fileType = call.getString("file_type") else {
            call.reject("file_type should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getDownloadList(bookId: bookID, fileType: fileType)
        call.resolve(["result": json])
    }
    
    @objc func getPercentage(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        guard let fileType = call.getString("file_type") else {
            call.reject("file_type should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getPercentage(bookId: bookID, fileType: fileType)
        call.resolve(["result": json])
    }
    
    @objc func getBookPercentage(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let fileType = call.getString("file_type") else {
            call.reject("file_type should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getBookPercentage(fileType: fileType)
        call.resolve(["result": json])
    }
    
    @objc func updateDownload(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let fileName = call.getString("file_name") else {
            call.reject("file_name should be string and can not be nil")
            return
        }
        guard let localPath = call.getString("local_path") else {
            call.reject("local_path should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.updateDownload(fileName: fileName, localPath: localPath)
        call.resolve(["result": json])
    }
    
    @objc func deleteDownloads(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        guard let fileType = call.getString("file_type") else {
            call.reject("file_type should be string and can not be nil")
            return
        }
        let chapterDownloads = call.getBool("chapterDownloads") ?? false
        let studyDownloads = call.getBool("studyDownloads") ?? false
        let json = BibleDataManager.shared.deleteDownloads(bookId: bookID, fileType: fileType, chapterDownloads: chapterDownloads, studyDownloads: studyDownloads)
        call.resolve(["result": json])
    }
    
    @objc func delete(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        guard let fileType = call.getString("file_type") else {
            call.reject("file_type should be string and can not be nil")
            return
        }
        let chapterNumber = call.getString("chapter_number") ?? ""
        let uuid = call.getString("uuid") ?? ""
        let json = BibleDataManager.shared.delete(bookId: bookID, fileType: fileType, chapterNumber: chapterNumber, uuid: uuid)
        call.resolve(["result": json])
    }
    
    @objc func getBookDownloads(_ call: CAPPluginCall) {
        print("Function: \(#function), line: \(#line)")
        guard let bookID = call.getString("book_id") else {
            call.reject("book_id should be string and can not be nil")
            return
        }
        let json = BibleDataManager.shared.getBookDownloads(bookId: bookID)
        call.resolve(["result": json])
    }
}
