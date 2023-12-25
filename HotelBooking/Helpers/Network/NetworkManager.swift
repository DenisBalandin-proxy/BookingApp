//
//  NetworkManager.swift
//  HotelBooking
//
//  Created by Denis on 12/19/23.
//

import Foundation

enum URLs: String {
    case startHotelPage = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    case rooms = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    case booking = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetchData<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else  {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }
}
