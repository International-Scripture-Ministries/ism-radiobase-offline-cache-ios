//
//  Book.swift
//
//  Created by fahid on 11/04
//

import Foundation
import RealmSwift
import ObjectMapper

class Book: Object, Mappable {
    
    @objc dynamic var bibleId = ""
    @objc dynamic var id = ""
    @objc dynamic var abbreviation = ""
    @objc dynamic var name = ""
    @objc dynamic var nameLong = ""
    @objc dynamic var bookOrder = 0
    @objc dynamic var testament = ""
    @objc dynamic var number_of_chapters = 0
    @objc dynamic var book_name_eng = ""
    @objc dynamic var image_path = ""
    
    enum CodingKeys: String {
        case bibleId
        case id
        case abbreviation
        case name
        case nameLong
        case bookOrder
        case testament
        case number_of_chapters
        case book_name_eng
        case image_path
    }
    
    required public override init() {
        super.init()
        // Perform further initialization
    }
    
    required init?(map: ObjectMapper.Map) {
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        bibleId <- map[CodingKeys.bibleId.rawValue]
        id <- map[CodingKeys.id.rawValue]
        abbreviation <- map[CodingKeys.abbreviation.rawValue]
        name <- map[CodingKeys.name.rawValue]
        nameLong <- map[CodingKeys.nameLong.rawValue]
        bookOrder <- map[CodingKeys.bookOrder.rawValue]
        testament <- map[CodingKeys.testament.rawValue]
        number_of_chapters <- map[CodingKeys.number_of_chapters.rawValue]
        book_name_eng <- map[CodingKeys.book_name_eng.rawValue]
        image_path <- map[CodingKeys.image_path.rawValue]
    }
}

extension Book {
    
    func toJsonForGetAllBooks() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.bibleId.rawValue] = bibleId
        dicto[CodingKeys.id.rawValue] = id
        dicto[CodingKeys.abbreviation.rawValue] = abbreviation
        dicto[CodingKeys.name.rawValue] = name
        dicto[CodingKeys.nameLong.rawValue] = nameLong
        dicto[CodingKeys.bookOrder.rawValue] = bookOrder
        dicto[CodingKeys.testament.rawValue] = testament
        dicto[CodingKeys.number_of_chapters.rawValue] = number_of_chapters
        dicto[CodingKeys.book_name_eng.rawValue] = book_name_eng
        dicto[CodingKeys.image_path.rawValue] = image_path
        return dicto
    }
    
    func toTotalDownloadsJson() -> [String:Any] {
        var dicto = [String : Any]()
        dicto["book_id"] = self.id
        dicto["book_name"] = self.name
        return dicto
    }
}
