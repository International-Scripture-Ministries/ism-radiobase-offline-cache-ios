//
//  Chapter.swift
//  OfflineFromDBDemo
//
//  Created by Fahid Attique on 24/10/2023.
//

import Foundation
import RealmSwift
import ObjectMapper

class Chapter: Object, Mappable {

    @objc dynamic var _id = ""
    @objc dynamic var bibleId = ""
    @objc dynamic var bookId = ""
    @objc dynamic var id = ""
    @objc dynamic var number = ""
    @objc dynamic var bible = ""
    @objc dynamic var book = ""

    enum CodingKeys: String {
        case _id
        case bibleId
        case bookId
        case id
        case number
        case bible
        case book
    }
    
    required public override init() {
        super.init()
        // Perform further initialization
    }

    required init?(map: ObjectMapper.Map) {
    }
    
    func mapping(map: ObjectMapper.Map) {
        _id <- map[CodingKeys._id.rawValue]
        bibleId <- map[CodingKeys.bibleId.rawValue]
        bookId <- map[CodingKeys.bookId.rawValue]
        id <- map[CodingKeys.id.rawValue]
        number <- map[CodingKeys.number.rawValue]
        bible <- map[CodingKeys.bible.rawValue]
        book <- map[CodingKeys.book.rawValue]
    }
}

extension Chapter {
    
    func toJson() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys._id.rawValue] = _id
        dicto[CodingKeys.bibleId.rawValue] = bibleId
        dicto[CodingKeys.bookId.rawValue] = bookId
        dicto[CodingKeys.id.rawValue] = id
        dicto[CodingKeys.number.rawValue] = number
        dicto[CodingKeys.bible.rawValue] = bible
        dicto[CodingKeys.book.rawValue] = book
        return dicto
    }
}
