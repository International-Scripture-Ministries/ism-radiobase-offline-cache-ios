import UIKit
import RealmSwift
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start()
    }
    
    func start() {

        //  ------------------------------------------------------------
        /// To created realm db and to get file path
        /// once you have the realm.db file, replace it with file in folder Resources --> DB

//          BibleDataManager().createdRealmDatabase()
//          return
        //  ------------------------------------------------------------
        
        
        _ = BibleDataManager.shared.setupPrepopulatedDB()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            print("getAllBooks")
//            _ = BibleDataManager.shared.getAllBooks()
//
            print("getVerses start")
            let verses = BibleDataManager.shared.getVerses(bookId: "GEN", bibleId: "fd1da25634593297-01", chapterNumber: 1)
            print("verses.count: \(verses.count)")

            print("getBookTeaching start")
            let bookTeachings = BibleDataManager.shared.getBookTeaching(bookId: "1CH")
            print("bookTeachings.count: \(bookTeachings.count)")

//            print("getTeaching")
//            _ = BibleDataManager.shared.getTeaching(bookId: "1CH", teachingUUID: "6f0c75ba-0f7c-4eea-a3d0-1869c0bea637")
//
//            print("getTeaching")
//            _ = BibleDataManager.shared.getTeachings(bibleBook: "1CH", chapterNumber: 11, verseNumber: "1")
//
//            print("getTotalDownloads")
//            _ = BibleDataManager.shared.getTotalDownloads()
//
//            print("getDownloadList --> Chapters")
//            _ = BibleDataManager.shared.getDownloadList(bookId: "1CH", fileType: "chapter")
//
//            print("getDownloadList --> Teachings")
//            _ = BibleDataManager.shared.getDownloadList(bookId: "1CH", fileType: "teaching")
//
//            print("getPercentage --> Chapters")
//            _ = BibleDataManager.shared.getPercentage(bookId: "1CH", fileType: "chapter")
//
            
//            print("updateDownload --> Teaching")
//            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_teaching_6f0c75ba-0f7c-4eea-a3d0-1869c0bea637.mp3", localPath: "local path 1")
//
            print("getPercentage --> Teachings")
            _ = BibleDataManager.shared.getPercentage(bookId: "1CH", fileType: "teaching")
            
            print("getBookPercentage --> Chapters")
            _ = BibleDataManager.shared.getBookPercentage(fileType: "chapter")

            print("getBookPercentage --> Teachings")
            _ = BibleDataManager.shared.getBookPercentage(fileType: "teaching")
            
            print("getPercentage --> Chapters")
            _ = BibleDataManager.shared.getPercentage(bookId: "1CH", fileType: "chapter")


            print("updateDownload --> Chapter")
            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_chapter_1.mp3", localPath: "local path 1")
            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_chapter_10.mp3", localPath: "local path 10")
            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_chapter_11.mp3", localPath: "local path 11")
            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_chapter_12.mp3", localPath: "local path 12")

            print("updateDownload --> Teaching")
            _ = BibleDataManager.shared.updateDownload(fileName: "1CH_teaching_6f0c75ba-0f7c-4eea-a3d0-1869c0bea637.mp3", localPath: "Testing/GEN_teaching_678687-798798-890")
//
//
//            print("deleteDownloads --> single")
//            _ = BibleDataManager.shared.deleteDownloads(bookId: "1CH", fileType: "single", chapterDownloads: true, studyDownloads: true)
//
//            print("deleteDownloads --> all")
//            _ = BibleDataManager.shared.deleteDownloads(bookId: "1CH", fileType: "all", chapterDownloads: true, studyDownloads: true)
//
//            print("delete --> chapter numer")
//            _ = BibleDataManager.shared.delete(bookId: "GEN", fileType: "chapter", chapterNumber: "5", uuid: "")
//
//            print("delete --> teaching uuid")
//            _ = BibleDataManager.shared.delete(bookId: "GEN", fileType: "teaching", chapterNumber: "", uuid: "123")
//
            print("getBookDownloads")
            _ = BibleDataManager.shared.getBookDownloads(bookId: "GEN")
        }
    }
}

    
