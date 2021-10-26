//
//  Launch.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 15.09.21.
//

import Foundation
import UIKit

struct LaunchModel: Decodable {
    var patchImage: UIImage?
    var id: String
    var name: String
    var dateUtc: Date
    var flightNumber: Int
    var upcoming: Bool
    let links: Links
    enum CodingKeys: String, CodingKey {
        case links
        case dateUtc
        case flightNumber
        case name
        case upcoming
        case id
    }
}

// MARK: - Links
struct Links: Decodable {
    let patch: Patch
//    let reddit: Reddit
//    let flickr: Flickr
//    let presskit: String
//    let webcast: String
//    let youtubeID: String
//    let article, wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case patch
//             case reddit, flickr, presskit, webcast
//        case youtubeID = "youtube_id"
//        case article, wikipedia
    }
}

// MARK: - Flickr
//struct Flickr: Decodable {
//    let small: [String]?
//    let original: [String]
//}

// MARK: - Patch
struct Patch: Decodable {
    let small, large: String?
}

// MARK: - Reddit
//struct Reddit: Decodable {
//    let campaign, launch, media: String
//    let recovery: String?
//}
