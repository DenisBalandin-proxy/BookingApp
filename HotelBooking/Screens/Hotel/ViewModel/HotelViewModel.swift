//
//  HotelViewModel.swift
//  HotelBooking
//
//  Created by Denis on 12/19/23.
//

import Combine

@MainActor
class HotelViewModel: ObservableObject {
    
    @Published var hotel: Hotel?
    
    func fetchData() async {
        do {
            hotel = try await NetworkManager.shared.fetchData(from: URLs.startHotelPage.rawValue)
        }
        catch {
            print("ERROR IN FETCHING")
        }
    }
    
    func prepareDataForMainInfoBlock() -> MainHotelInformation {
        MainHotelInformation(
            name: hotel?.name ?? "",
            adress: hotel?.adress ?? "",
            ratingName: hotel?.ratingName ?? "",
            rating: hotel?.rating ?? 0
        )
    }
}
