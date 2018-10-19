//
//  User.swift
//  TVShows
//
//  Created by Ivan Milicevic on 19/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import Foundation

struct User: Codable {
    let email: String
    let type: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case email
        case type
        case id = "_id"
    }
}
