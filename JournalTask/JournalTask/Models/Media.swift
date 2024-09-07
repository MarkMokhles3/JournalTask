//
//  Media.swift
//  JournalTask
//
//  Created by MarkFathy on 07/09/2024.
//

import Foundation

struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
}
