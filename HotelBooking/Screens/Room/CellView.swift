//
//  CellView.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import SwiftUI

struct CellView: View {
    
    var room: Room
    var coordinator: Coordinator
    var hotelTitle = ""
    
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PhotosView(photos: room.imageUrls)
                .frame(height: 257)
            
            Text(room.name)
                .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                ForEach(room.peculiarities, id: \.self) { element in
                    Text(element)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .background(Color(hex: "#FBFBFC"))
                        .foregroundStyle(Color(hex: "#828796"))
                        .cornerRadius(5)
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Button {
                print("selected room")
            } label: {
                HStack {
                    Text("Подробнее о номере")
                        .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                    
                    Image(.iconsTwo)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color(hex: "#0D72FF").opacity(0.2))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 5
                    )
                )
            }
            .padding(.leading, 16)
            
            HStack(alignment: .bottom) {
                Text("\(room.price.formatted(.number.locale(.init(identifier: "fr_FR"))) + " " + "₽")")
                    .font(.custom(Resources.Fonts.customBold, fixedSize: 30))
                    .foregroundStyle(Color(hex: "#000000"))
                
                Text("\(room.pricePer.lowercased())")
                    .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                    .foregroundStyle(Color(hex: "#828796"))
                
                Spacer()
            }
            .padding(.leading, 16)
            
            MainButtonView(buttonTitle: "Выбрать номер")
                .background(.white)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            coordinator.push(.booking, with: "Бронирование")
                        }
                )
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}
