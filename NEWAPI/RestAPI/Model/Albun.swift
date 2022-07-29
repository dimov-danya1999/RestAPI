//
//  Albun.swift
//  RestAPI
//
//  Created by mac on 29.07.2022.
//

import Foundation

// MARK: - Albun
struct Albun: Codable {
    let userID, id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albuns = [Albun]
