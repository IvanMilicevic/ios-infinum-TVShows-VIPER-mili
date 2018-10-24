//
//  Comment.swift
//  TVShows
//
//  Created by Ivan Milicevic on 24/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import Foundation

struct Comment: Codable {

    let text: String
    let episodeId: String
    let userEmail: String
    let id: String


    enum CodingKeys: String, CodingKey {
        case text
        case episodeId
        case userEmail
        case id = "_id"
    }
}
