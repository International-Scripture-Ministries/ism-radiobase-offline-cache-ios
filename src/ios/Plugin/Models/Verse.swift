//
//  Verse.swift
//
//  Created by fahid
//

import Foundation
import RealmSwift
import ObjectMapper

class Verse: Object, Mappable {

    @objc dynamic var _id = ""
    @objc dynamic var bibleId = ""
    @objc dynamic var id = ""
    @objc dynamic var bookId = ""
    @objc dynamic var chapter: Chapter?
    @objc dynamic var chapterId = ""
    @objc dynamic var content = ""
    @objc dynamic var reference = ""
    @objc dynamic var verseNumber = ""
    @objc dynamic var chapterNumber = 0
    @objc dynamic var teaching: Teaching?
    @objc dynamic var chapterAudioUrl = ""
    
    enum CodingKeys: String {
        case _id
        case bibleId
        case id
        case bookId
        case chapter
        case chapterId
        case content
        case reference
        case verseNumber
        case chapterNumber
        case teaching
        case chapterAudioUrl
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
        id <- map[CodingKeys.id.rawValue]
        bookId <- map[CodingKeys.bookId.rawValue]
        chapter <- map[CodingKeys.chapter.rawValue]
        chapterId <- map[CodingKeys.chapterId.rawValue]
        content <- map[CodingKeys.content.rawValue]
        reference <- map[CodingKeys.reference.rawValue]
        verseNumber <- map[CodingKeys.verseNumber.rawValue]
        chapterNumber <- map[CodingKeys.chapterNumber.rawValue]
        teaching <- map[CodingKeys.teaching.rawValue]
        chapterAudioUrl <- map[CodingKeys.chapterAudioUrl.rawValue]
    }
}

extension Verse {
    
    func toJson() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys._id.rawValue] = _id
        dicto[CodingKeys.bibleId.rawValue] = bibleId
        dicto[CodingKeys.id.rawValue] = id
        dicto[CodingKeys.bookId.rawValue] = bookId
        dicto[CodingKeys.chapter.rawValue] = chapter?.toJson()
        dicto[CodingKeys.chapterId.rawValue] = chapterId
        dicto[CodingKeys.content.rawValue] = content
        dicto[CodingKeys.reference.rawValue] = reference
        dicto[CodingKeys.verseNumber.rawValue] = verseNumber
        dicto[CodingKeys.chapterNumber.rawValue] = chapterNumber
        dicto[CodingKeys.teaching.rawValue] = teaching?.toJson()
        dicto[CodingKeys.chapterAudioUrl.rawValue] = chapterAudioUrl
        
        return dicto
    }
}
