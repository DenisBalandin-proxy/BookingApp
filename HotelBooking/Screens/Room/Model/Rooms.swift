//
//  Rooms.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import Foundation

struct Rooms: Decodable {
    let rooms: [Room]
}

struct Room: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
