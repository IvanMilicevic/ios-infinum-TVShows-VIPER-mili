//
//  ShowEpisode.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import Foundation

struct ShowEpisode: Codable {
    let id: String
    let title: String
    let description: String
    let imageUrl: String
    let episodeNumber: Int?
    let season: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case imageUrl
        case episodeNumber
        case season

    }
}

extension ShowEpisode {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let title = try container.decode(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)
        let imageUrl = try container.decode(String.self, forKey: .imageUrl)
        let episodeNumber = try? container.decode(String.self, forKey: .episodeNumber)
        let season = try? container.decode(String.self, forKey: .season)

        self.init(id: id,
                  title: title,
                  description: description,
                  imageUrl: imageUrl,
                  episodeNumber: episodeNumber != nil ? Int(episodeNumber!) : nil,
                  season: season != nil ? Int(season!) : nil)

    }
}
