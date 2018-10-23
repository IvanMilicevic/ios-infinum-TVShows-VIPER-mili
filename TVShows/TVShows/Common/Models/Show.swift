//
//  Show.swift
//  TVShows
//
//  Created by Ivan Milicevic on 19/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import Foundation

struct Show: Codable {
    let id: String
    let title: String
    let imageUrl: String?
    let likesCount: Int?


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case imageUrl
        case likesCount

    }
}
