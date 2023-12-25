//
//  AboutHotelView.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import SwiftUI

struct AboutHotelView: View {
    
    var hotel: Hotel?
    
    private let pictures = ["emoji-happy", "tick-square", "close-square"]
    private let title = ["Удобства", "Что включено", "Что не включено"]
    private let subtitle = "Самое необходимое"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Об отеле")
                    .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
                    .foregroundStyle(.black)
                    .padding(.top, 16)
                
                Spacer()
            }.padding(.leading, 16)
            
            WrappingHStack(
                id: \.self,
                alignment: .leading,
                horizontalSpacing: 8,
                verticalSpacing: 8
            ) {
                ForEach(
                    hotel?.aboutTheHotel.peculiarities ?? [],
                    id: \.self) { element in
                        
                        Text(element)
                            .padding(EdgeInsets(
                                top: 5,
                                leading: 10,
                                bottom: 5,
                                trailing: 10)
                            )
                            .background(Color(hex: "#FBFBFC"))
                            .foregroundStyle(Color(hex: "#828796"))
                            .cornerRadius(5)
                    }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Text("\(hotel?.aboutTheHotel.description ?? "")")
                .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                .foregroundStyle(.black)
                .padding(EdgeInsets(top: 0,
                                    leading: 16,
                                    bottom: 0,
                                    trailing: 16)
                )
            
            ListView()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 15
                    )
                )
                .padding(EdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 16,
                    trailing: 16)
                )
        }.background(.white)
            .frame(maxWidth: .infinity)
    }
}
