//
//  JSONableModels.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 12/04/2022.
//

import Foundation

protocol ToJSON {
    func toJSON() -> [String:Any]
}

extension Verse: ToJSON {
    func toJSON() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.bible_book.rawValue] = bible_book
        dicto[CodingKeys.bible_book_eng.rawValue] = bible_book_eng
        dicto[CodingKeys.book_id.rawValue] = book_id
        dicto[CodingKeys.book_name.rawValue] = book_name
        dicto[CodingKeys.book_order.rawValue] = book_order
        dicto[CodingKeys.chapter_id.rawValue] = chapter_id
        dicto[CodingKeys.chapter_title.rawValue] = chapter_title
        dicto[CodingKeys.folder_path.rawValue] = folder_path
        dicto[CodingKeys.paragraph_number.rawValue] = paragraph_number
        dicto[CodingKeys.teaching_audio.rawValue] = teaching_audio
        dicto[CodingKeys.teaching_end_point.rawValue] = teaching_end_point
        dicto[CodingKeys.teaching_file_name.rawValue] = teaching_file_name
        dicto[CodingKeys.teaching_id.rawValue] = teaching_id
        dicto[CodingKeys.teaching_name.rawValue] = teaching_name
        dicto[CodingKeys.teaching_start_point.rawValue] = teaching_start_point
        dicto[CodingKeys.teachings_badge_image.rawValue] = teachings_badge_image
        dicto[CodingKeys.verse_id.rawValue] = verse_id
        dicto[CodingKeys.verse_text.rawValue] = verse_text
        return dicto
    }

    func toJSONGetBookTeachingByBookID() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.bible_book.rawValue] = bible_book
        dicto[CodingKeys.bible_book_eng.rawValue] = bible_book_eng
        dicto[CodingKeys.book_id.rawValue] = book_id
        dicto[CodingKeys.book_name.rawValue] = book_name
        dicto[CodingKeys.teaching_audio.rawValue] = teaching_audio
        dicto[CodingKeys.teaching_file_name.rawValue] = teaching_file_name
        dicto[CodingKeys.teaching_id.rawValue] = teaching_id
        dicto[CodingKeys.teaching_name.rawValue] = teaching_name
        dicto[CodingKeys.teachings_badge_image.rawValue] = teachings_badge_image
        return dicto
    }
}

extension Chapter: ToJSON {
    func toJSON() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.chapter_audio.rawValue] = chapter_audio
        dicto[CodingKeys.chapter_id.rawValue] = chapter_id
        dicto[CodingKeys.copyright_info.rawValue] = copyright_info
        var allVerses = Array<[String:Any]>()
        verses.forEach{allVerses.append($0.toJSON())}
        dicto[CodingKeys.verses.rawValue] = allVerses
        return dicto
    }
}

extension Book: ToJSON {
    func toJSON() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.book_id.rawValue] = book_id
        dicto[CodingKeys.book_name.rawValue] = book_name
        dicto[CodingKeys.book_order.rawValue] = book_order
        dicto[CodingKeys.chapters.rawValue] = chapters
        dicto[CodingKeys.dam_id.rawValue] = dam_id
        dicto[CodingKeys.lang_code.rawValue] = lang_code
        dicto[CodingKeys.number_of_chap.rawValue] = number_of_chap
        var allChapters = Array<[String:Any]>()
        chapters_list.forEach{allChapters.append($0.toJSON())}
        dicto[CodingKeys.chapters_list.rawValue] = allChapters
        return dicto
    }
    
    
    func toJSONGetAllBooks() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.book_id.rawValue] = book_id
        dicto[CodingKeys.book_id_eng.rawValue] = ""
        dicto[CodingKeys.book_name.rawValue] = book_name
        dicto[CodingKeys.book_order.rawValue] = book_order
        dicto[CodingKeys.chapters.rawValue] = chapters
        dicto[CodingKeys.dam_id.rawValue] = dam_id
        dicto[CodingKeys.lang_code.rawValue] = lang_code
        dicto[CodingKeys.number_of_chapters.rawValue] = "\(chapters_list.count)"
        return dicto
    }
}
