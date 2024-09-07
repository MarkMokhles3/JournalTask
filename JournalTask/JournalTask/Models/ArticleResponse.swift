//
//  ArticleResponse.swift
//  JournalTask
//
//  Created by MarkFathy on 03/09/2024.
//

import Foundation

struct ArticleResponse: Codable {
    let numResults: Int?
    let results: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case results
    }
}
