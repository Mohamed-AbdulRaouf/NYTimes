//
//  PopularNews.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import Foundation

struct NewsModel: Codable {
    let results : [PopularNews]?
}

struct PopularNews: Codable {
    
    let title: String
    let byLine: String
    let subsection: String
    let date: String
    let media : [Media]?
    
    enum CodingKeys: String, CodingKey {
        case title, subsection, media
        case byLine = "byline"
        case date = "published_date"
    }
}
