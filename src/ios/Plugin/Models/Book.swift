//
//  Book.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 11/04/2022.
//

import Foundation
import RealmSwift
import ObjectMapper

class Book: Object, Mappable {
    
    @objc dynamic var book_id = ""
    @objc dynamic var book_name = ""
    @objc dynamic var book_order = ""
    @objc dynamic var chapters = ""
    @objc dynamic var dam_id = ""
    @objc dynamic var lang_code = ""
    @objc dynamic var number_of_chap = ""
    dynamic var chapters_list = List<Chapter>()
    
    enum CodingKeys: String {
        case book_id
        case book_name
        case book_order
        case chapters
        case dam_id
        case lang_code
        case number_of_chap
        case chapters_list
        case book_id_eng
        case number_of_chapters
    }

    var isOldTestament: Bool {
        if let char = dam_id.last {
            return char == "O"
        }
        return false
    }
    
    override init() {
        super.init()
    }
    
    required init?(map: ObjectMapper.Map) {
    }
    
    // Mappable
    func mapping(map: ObjectMapper.Map) {
        book_id <- map[CodingKeys.book_id.rawValue]
        book_name <- map[CodingKeys.book_name.rawValue]
        book_order <- map[CodingKeys.book_order.rawValue]
        chapters <- map[CodingKeys.chapters.rawValue]
        dam_id <- map[CodingKeys.dam_id.rawValue]
        lang_code <- map[CodingKeys.lang_code.rawValue]
        number_of_chap <- map[CodingKeys.number_of_chap.rawValue]
        chapters_list <- map[CodingKeys.chapters_list.rawValue]
    }
}


