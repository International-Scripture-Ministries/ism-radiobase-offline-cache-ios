//
//  Teaching.swift
//  OfflineFromDBDemo
//
//  Created by Fahid Attique on 24/10/2023.
//

import Foundation
import RealmSwift
import ObjectMapper

class Teaching: Object, Mappable {

    @objc dynamic var art_url = ""
    @objc dynamic var uuid = ""
    @objc dynamic var audio_duration = 0
    @objc dynamic var audio_format = ""
    @objc dynamic var audio_format_name = ""
    @objc dynamic var bible_book = ""
    @objc dynamic var bible_chapter_end = 0
    @objc dynamic var bible_chapter_start = 0
    @objc dynamic var bible_verse_end = 0
    @objc dynamic var bible_verse_start = 0
    @objc dynamic var created = ""
    @objc dynamic var created_by = ""
    @objc dynamic var _description = ""
    @objc dynamic var language = ""
    @objc dynamic var mime_type = ""
    @objc dynamic var name = ""
    @objc dynamic var organization = ""
    @objc dynamic var original_audio_duration = 0
    @objc dynamic var primary_transcoder_status = ""
    @objc dynamic var recorded_date = ""
    @objc dynamic var scheduled_date = ""
    @objc dynamic var status = ""
    @objc dynamic var audio_path = ""

    enum CodingKeys: String {
        case art_url
        case uuid
        case audio_duration
        case audio_format
        case audio_format_name
        case bible_book
        case bible_chapter_end
        case bible_chapter_start
        case bible_verse_end
        case bible_verse_start
        case created
        case created_by
        case description
        case language
        case mime_type
        case name
        case organization
        case original_audio_duration
        case primary_transcoder_status
        case recorded_date
        case scheduled_date
        case status
        case audio_path
    }
    
    required public override init() {
        super.init()
        // Perform further initialization
    }

    required init?(map: ObjectMapper.Map) {
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        art_url <- map[CodingKeys.art_url.rawValue]
        uuid <- map[CodingKeys.uuid.rawValue]
        audio_duration <- map[CodingKeys.audio_duration.rawValue]
        audio_format <- map[CodingKeys.audio_format.rawValue]
        audio_format_name <- map[CodingKeys.audio_format_name.rawValue]
        bible_book <- map[CodingKeys.bible_book.rawValue]
        bible_chapter_end <- map[CodingKeys.bible_chapter_end.rawValue]
        bible_chapter_start <- map[CodingKeys.bible_chapter_start.rawValue]
        bible_verse_end <- map[CodingKeys.bible_verse_end.rawValue]
        bible_verse_start <- map[CodingKeys.bible_verse_start.rawValue]
        created <- map[CodingKeys.created.rawValue]
        created_by <- map[CodingKeys.created_by.rawValue]
        _description <- map[CodingKeys.description.rawValue]
        language <- map[CodingKeys.language.rawValue]
        mime_type <- map[CodingKeys.mime_type.rawValue]
        name <- map[CodingKeys.name.rawValue]
        organization <- map[CodingKeys.organization.rawValue]
        original_audio_duration <- map[CodingKeys.original_audio_duration.rawValue]
        primary_transcoder_status <- map[CodingKeys.primary_transcoder_status.rawValue]
        recorded_date <- map[CodingKeys.recorded_date.rawValue]
        scheduled_date <- map[CodingKeys.scheduled_date.rawValue]
        status <- map[CodingKeys.status.rawValue]
        audio_path <- map[CodingKeys.audio_path.rawValue]
    }
}

extension Teaching {
    
    func toJson() -> [String:Any] {
        var dicto = [String : Any]()
        dicto[CodingKeys.art_url.rawValue] = art_url
        dicto[CodingKeys.uuid.rawValue] = uuid
        dicto[CodingKeys.audio_duration.rawValue] = audio_duration
        dicto[CodingKeys.audio_format.rawValue] = audio_format
        dicto[CodingKeys.audio_format_name.rawValue] = audio_format_name
        dicto[CodingKeys.bible_book.rawValue] = bible_book
        dicto[CodingKeys.bible_chapter_end.rawValue] = bible_chapter_end
        dicto[CodingKeys.bible_chapter_start.rawValue] = bible_chapter_start
        dicto[CodingKeys.bible_verse_end.rawValue] = bible_verse_end
        dicto[CodingKeys.bible_verse_start.rawValue] = bible_verse_start
        dicto[CodingKeys.created.rawValue] = created
        dicto[CodingKeys.created_by.rawValue] = created_by
        dicto[CodingKeys.description.rawValue] = _description
        dicto[CodingKeys.language.rawValue] = language
        dicto[CodingKeys.mime_type.rawValue] = mime_type
        dicto[CodingKeys.name.rawValue] = name
        dicto[CodingKeys.organization.rawValue] = organization
        dicto[CodingKeys.original_audio_duration.rawValue] = original_audio_duration
        dicto[CodingKeys.primary_transcoder_status.rawValue] = primary_transcoder_status
        dicto[CodingKeys.recorded_date.rawValue] = recorded_date
        dicto[CodingKeys.scheduled_date.rawValue] = scheduled_date
        dicto[CodingKeys.status.rawValue] = status
        dicto[CodingKeys.audio_path.rawValue] = audio_path
        return dicto
    }
}
