//
//  ListView.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import SwiftUI

struct ListView: View {
    
    private let pictures = ["emoji-happy", "tick-square", "close-square"]
    private let title = ["Удобства", "Что включено", "Что не включено"]
    private let subtitle = "Самое необходимое"
    
    var body: some View {
        VStack {
            ForEach(title.indices, id: \.self) { index in
                VStack{
                    HStack {
                        Image(pictures[index])
                        
                        VStack {
                            VStack(alignment: .leading) {
                                Text(title[index])
                                    .font(.custom(
                                        Resources.Fonts.custom,
                                        fixedSize: 16)
                                    )
                                    .foregroundStyle(Color(hex: "#2C3035"))
                                
                                Text("\(subtitle)")
                                    .font(.custom(
                                        Resources.Fonts.custom,
                                        fixedSize: 14)
                                    )
                                    .foregroundStyle(Color(hex: "#828796"))
                            }.padding(EdgeInsets(
                                top: 0,
                                leading: 12,
                                bottom: 0,
                                trailing: 0)
                            )
                        }
                        Spacer()
                        
                        Image(.icons)
                    }.padding(EdgeInsets(
                        top: 0,
                        leading: 10,
                        bottom: 0,
                        trailing: 10)
                    )
                    Divider()
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 55,
                            bottom: 0,
                            trailing: 15)
                        )
                }
            }
        }
        .padding()
        .background(Color(hex: "#FBFBFC"))
    }
}
