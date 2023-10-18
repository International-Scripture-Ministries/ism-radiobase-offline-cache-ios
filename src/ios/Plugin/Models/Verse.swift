//
//  Verse.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 11/04/2022.
//

import Foundation
import RealmSwift
import ObjectMapper

enum DownloadableContentType: Int {
    case none, teachingAudio, teachingsBadgeImage
}

class Verse: Object, Mappable {
    
    static let compressedTeachingAudioBaseURL = "https://ttb-transcoder-final-prod-compressed.s3.us-west-2.amazonaws.com/ukraine/"
    
    @objc dynamic var bible_book = ""
    @objc dynamic var bible_book_eng = ""
    @objc dynamic var book_id = ""
    @objc dynamic var book_name = ""
    @objc dynamic var book_order = ""
    @objc dynamic var chapter_id = ""
    @objc dynamic var chapter_title = ""
    @objc dynamic var folder_path = ""
    @objc dynamic var paragraph_number = ""
    @objc dynamic var teaching_audio = ""
    @objc dynamic var teaching_end_point = ""
    @objc dynamic var teaching_file_name = ""
    @objc dynamic var teaching_id = ""
    @objc dynamic var teaching_name = ""
    @objc dynamic var teaching_start_point = ""
    @objc dynamic var teachings_badge_image = ""
    @objc dynamic var verse_id = ""
    @objc dynamic var verse_text = ""
    
    var compressedTeachingAudioURL: String {
        return Verse.compressedTeachingAudioBaseURL + teaching_file_name
    }
    
    var currentDownloadingContentType: DownloadableContentType = .none
    var remoteURLForContentType: String {
        switch currentDownloadingContentType {
        case .teachingAudio:
            return compressedTeachingAudioURL
        case .teachingsBadgeImage:
            return teachings_badge_image
        default:
            return ""
        }
    }
    var localURLForContentType: URL? {
        switch currentDownloadingContentType {
        case .teachingAudio:
            return localURLToSaveTeachingAudio
        case .teachingsBadgeImage:
            return localURLToSaveTeachingsBadgeImage
        default:
            return nil
        }
    }

    enum CodingKeys: String {
        case bible_book
        case bible_book_eng
        case book_id
        case book_name
        case book_order
        case chapter_id
        case chapter_title
        case folder_path
        case paragraph_number
        case teaching_audio
        case teaching_end_point
        case teaching_file_name
        case teaching_id
        case teaching_name
        case teaching_start_point
        case teachings_badge_image
        case verse_id
        case verse_text
    }
    
    override init() {
        super.init()
    }

    required init?(map: ObjectMapper.Map) {
    }
    
    // Mappable
    func mapping(map: ObjectMapper.Map) {
        bible_book <- map[CodingKeys.bible_book.rawValue]
        bible_book_eng <- map[CodingKeys.bible_book_eng.rawValue]
        book_id <- map[CodingKeys.book_id.rawValue]
        book_name <- map[CodingKeys.book_name.rawValue]
        book_order <- map[CodingKeys.book_order.rawValue]
        chapter_id <- map[CodingKeys.chapter_id.rawValue]
        chapter_title <- map[CodingKeys.chapter_title.rawValue]
        folder_path <- map[CodingKeys.folder_path.rawValue]
        paragraph_number <- map[CodingKeys.paragraph_number.rawValue]
        teaching_audio <- map[CodingKeys.teaching_audio.rawValue]
        teaching_end_point <- map[CodingKeys.teaching_end_point.rawValue]
        teaching_file_name <- map[CodingKeys.teaching_file_name.rawValue]
        teaching_id <- map[CodingKeys.teaching_id.rawValue]
        teaching_name <- map[CodingKeys.teaching_name.rawValue]
        teaching_start_point <- map[CodingKeys.teaching_start_point.rawValue]
        teachings_badge_image <- map[CodingKeys.teachings_badge_image.rawValue]
        verse_id <- map[CodingKeys.verse_id.rawValue]
        verse_text <- map[CodingKeys.verse_text.rawValue]
    }

    var localRelativePathTeachingAudio: String {
        var path = ""
        path = path + DocumentsManager.shared.versesFolderName + "/"
        path = path + DocumentsManager.shared.teachingAudiosFolderName + "/"
        path = path + teaching_file_name
        return path
    }
    
    var localRelativePathTeachingsBadgeImage: String {
        let name = self.teachings_badge_image.components(separatedBy: "/").last ?? ""
        var path = ""
        path = path + DocumentsManager.shared.versesFolderName + "/"
        path = path + DocumentsManager.shared.teachingsBadgeImagesFolderName + "/"
        path = path + name
        return path
    }

    private var localURLToSaveTeachingAudio: URL? {
        let localURL = DocumentsManager.shared.teachingAudiosFolder.appendingPathComponent(self.teaching_file_name)
        return localURL
    }

    private var localURLToSaveTeachingsBadgeImage: URL? {
        let name = self.teachings_badge_image.components(separatedBy: "/").last ?? ""
        guard !name.isEmpty else {
            print("unable to get image file name.")
            return nil
        }
        let localURL = DocumentsManager.shared.teachingsBadgeImagesFolder.appendingPathComponent(name)
        return localURL
    }
    
    func printVersesDirectoryContent() {
        switch currentDownloadingContentType {
        case .teachingAudio:
            DocumentsManager.shared.printDirectoryContent(url: DocumentsManager.shared.teachingAudiosFolder)
        case .teachingsBadgeImage:
            DocumentsManager.shared.printDirectoryContent(url: DocumentsManager.shared.teachingsBadgeImagesFolder)
        default:
            return
        }
    }
}
