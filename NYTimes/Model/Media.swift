//
//  Media.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import Foundation

struct Media: Codable {
    let mediaMetadata: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String?
}
