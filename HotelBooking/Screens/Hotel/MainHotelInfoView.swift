//
//  MainHotelInfoView.swift
//  HotelBooking
//
//  Created by Denis on 12/19/23.
//

import SwiftUI

struct MainHotelInfoView: View {
    
    var hotel: MainHotelInformation?
    
    //MARK: - body
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    ZStack {
                        HStack {
                            Image(.star)
                                .foregroundStyle(Color(hex: "#FFA800"))
                            Text("\(hotel?.rating ?? 0) \(hotel?.ratingName ?? "")")
                                
                                .foregroundStyle(Color(hex: "#FFA800"))
                        }.font(.custom(Resources.Fonts.custom, fixedSize: 16))
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }.background(Color(hex: "#FFC700").opacity(0.2))
                }
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 5
                    )
                )
                Text(hotel?.name ?? "")
                    .foregroundStyle(.black)
                    .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
                    
                Text(hotel?.adress ?? "")
                    .font(.custom(Resources.Fonts.custom, fixedSize: 14))
                    .foregroundStyle(Color(hex: "#0D72FF"))
                
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Spacer()
        }
    }
}
