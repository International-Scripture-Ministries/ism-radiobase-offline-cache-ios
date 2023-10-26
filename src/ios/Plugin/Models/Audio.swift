//
//  Audio.swift
//  OfflineFromDBDemo
//
//  Created by Fahid Attique on 24/10/2023.
//

import Foundation
import RealmSwift
import ObjectMapper

class Audio: Object, Mappable {

    @objc dynamic var bibleId = ""
    @objc dynamic var id = ""
    @objc dynamic var bookId = ""
    @objc dynamic var createdAt = ""
    @objc dynamic var number = ""
    @objc dynamic var reference = ""
    @objc dynamic var updatedAt = ""
    @objc dynamic var url = ""
    @objc dynamic var download_id = ""
    @objc dynamic var audio_path = ""

    enum CodingKeys: String {
        case bibleId
        case id
        case bookId
        case createdAt
        case number
        case reference
        case updatedAt
        case url
        case download_id
        case audio_path
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
        bookId <- map[CodingKeys.bookId.rawValue]
        createdAt <- map[CodingKeys.createdAt.rawValue]
        number <- map[CodingKeys.number.rawValue]
        reference <- map[CodingKeys.reference.rawValue]
        updatedAt <- map[CodingKeys.updatedAt.rawValue]
        url <- map[CodingKeys.url.rawValue]
        download_id <- map[CodingKeys.download_id.rawValue]
        audio_path <- map[CodingKeys.audio_path.rawValue]
    }
}
