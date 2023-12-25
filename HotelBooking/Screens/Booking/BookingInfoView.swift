//
//  BookingInfoView.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import SwiftUI

struct BookingInfoView: View {
    
    var booking: Booking?
    
    var body: some View {
        Grid(
            alignment: .leading,
            horizontalSpacing: 39,
            verticalSpacing: 16
        ) {
            GridRow {
                Text("Вылет из")
                    .foregroundStyle(Color(hex: "#828796"))
                Text(booking?.departure ?? "")
            }
            GridRow {
                Text("Страна, город")
                    .foregroundStyle(Color(hex: "#828796"))
                Text(booking?.arrivalCountry ?? "")
            }
            GridRow {
                Text("Даты")
                    .foregroundStyle(Color(hex: "#828796"))
                Text("\((booking?.tourDateStart) ?? "") - \((booking?.tourDateStop) ?? "")")
            }
            GridRow {
                Text("Кол-во ночей")
                    .foregroundStyle(Color(hex: "#828796"))
                Text("\(booking?.numberOfNights ?? 0)")
            }
            GridRow {
                Text("Отель")
                    .foregroundStyle(Color(hex: "#828796"))
                Text(booking?.hotelName ?? "")
            }
            GridRow {
                Text("Номер")
                    .foregroundStyle(Color(hex: "#828796"))
                Text(booking?.room ?? "")
            }
            GridRow {
                Text("Питание")
                    .foregroundStyle(Color(hex: "#828796"))
                Text(booking?.nutrition ?? "")
            }
            
        }
        .font(.custom(Resources.Fonts.custom, fixedSize: 16))
        .padding(.all, 16)
    }
}
