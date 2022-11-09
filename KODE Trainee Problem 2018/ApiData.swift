// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - Api
struct ApiData: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let avatarURL: String
    let birthday, department, firstName, id: String
    let lastName, phone, position, userTag: String

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatarUrl"
        case birthday, department, firstName, id, lastName, phone, position, userTag
    }
}
