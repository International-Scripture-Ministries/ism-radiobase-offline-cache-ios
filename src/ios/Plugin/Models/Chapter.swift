//
//  Chapter.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 11/04/2022.
//

import Foundation
import RealmSwift
import ObjectMapper

class Chapter: Object, Mappable {
    @objc dynamic var chapter_audio = ""
    @objc dynamic var chapter_id = ""
    @objc dynamic var copyright_info = ""
    dynamic var verses = List<Verse>()
    
    enum CodingKeys: String {
        case chapter_audio
        case chapter_id
        case copyright_info
        case verses
    }

    override init() {
        super.init()
    }

    required init?(map: ObjectMapper.Map) {
    }
    
    // Mappable
    func mapping(map: ObjectMapper.Map) {
        chapter_audio <- map[CodingKeys.chapter_audio.rawValue]
        chapter_id <- map[CodingKeys.chapter_id.rawValue]
        copyright_info <- map[CodingKeys.copyright_info.rawValue]
        verses <- map[CodingKeys.verses.rawValue]
    }
}
