//
//  FetchBeersResponse.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//

import Foundation

struct FetchBeersResponse: Codable, Equatable {
    let id: Int
    let name: String
    let description: String
    let tagline: String
    let imageURL: String
    let abv: Double
    let ibu: Double?

    enum CodingKeys: String, CodingKey {
        case name, id, tagline, description
        case imageURL = "image_url"
        case abv, ibu
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
