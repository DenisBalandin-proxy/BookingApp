//
//  BookingViewModel.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import Combine

@MainActor
class BookingViewModel: ObservableObject {
    
    @Published var booking: Booking?
    
    var payment: String {
        (
            (booking?.tourPrice ?? 0) +
            (booking?.fuelCharge ?? 0) +
            (booking?.serviceCharge ?? 0)
        ).formatted(.number.locale(.init(identifier: "fr_FR"))) + " " + "₽"
    }
    
    func fetchData() async {
        do {
            booking = try await NetworkManager.shared.fetchData(from: URLs.booking.rawValue)
        }
        catch {
            print("ERROR IN FETCHING")
        }
    }
    
    func prepareDataForMainInfoBlock() -> MainHotelInformation {
        MainHotelInformation(
            name: booking?.hotelName ?? "",
            adress: booking?.hotelAdress ?? "",
            ratingName: booking?.ratingName ?? "",
            rating: booking?.horating ?? 0
        )
    }
}
