//
//  Article.swift
//  JournalTask
//
//  Created by MarkFathy on 06/09/2024.
//

import Foundation

struct Article: Codable, Identifiable {
    let id: Int?
    let title: String?
    let abstract: String?
    let url: String?
    let byline: String?
    let publishedDate: String?
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case abstract
        case url
        case byline
        case media
        case publishedDate = "published_date"
    }
}
