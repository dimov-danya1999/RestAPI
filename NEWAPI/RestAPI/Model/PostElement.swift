//
//  PostElement.swift
//  RestAPI
//
//  Created by mac on 29.07.2022.
//

import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Post = [PostElement]
