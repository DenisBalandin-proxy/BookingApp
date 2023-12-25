//
//  MainButtonView.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import SwiftUI

struct MainButtonView: View {
    
    var buttonTitle = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "#0D72FF"))
                .frame(height: 48)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 15
                    )
                )
            Text("\(buttonTitle)")
                .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                .foregroundStyle(Color(hex: "#FFFFFF"))
        }.padding(EdgeInsets(
            top: 12,
            leading: 16,
            bottom: 0,
            trailing: 16)
        )
    }
}
