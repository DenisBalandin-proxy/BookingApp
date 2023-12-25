//
//  RoomsViewModel.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//
import Combine

@MainActor
class RoomsViewModel: ObservableObject {
    
    @Published var rooms: Rooms?
    
    func fetchData() async {
        do {
            rooms = try await NetworkManager.shared.fetchData(from: URLs.rooms.rawValue)
        }
        catch {
            print("ERROR IN FETCHING")
        }
    }
}
