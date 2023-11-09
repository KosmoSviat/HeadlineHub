//
//  NewsResponseObject.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 11.08.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
