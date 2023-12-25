//
//  TourAmountView.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import SwiftUI

struct TourAmountView: View {
    
    var booking: Booking?
    
    var payment: String
    
    //MARK: - body
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Тур")
                Spacer()
                Text("\(booking?.tourPrice ?? 0)")
            }
            HStack {
                Text("Топливный сбор")
                Spacer()
                Text("\(booking?.fuelCharge ?? 0)")
            }
            HStack {
                Text("Сервисный сбор")
                Spacer()
                Text("\(booking?.serviceCharge ?? 0)")
            }
            HStack {
                Text("К оплате")
                Spacer()
                Text(payment)
                    .foregroundStyle(Color(hex: "#0D72FF"))
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
}
