//
//  SuccessView.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import SwiftUI

struct SuccessView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var title = ""
    
    //MARK: - body
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                MainButtonView(buttonTitle: "Супер!")
                    .background(.white)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                coordinator.popToRoot()
                            }
                    )
            }
            VStack {
                ZStack {
                    Circle()
                        .foregroundStyle(Color(hex: "#F6F6F9"))
                        .frame(height: 94)
                    Text("🎉")
                        .font(.system(size: 44))
                }
                Text("Ваш заказ принят в работу")
                    .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
                
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                    .foregroundStyle(Color(hex: "#828796"))
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop(.success)
                }) {
                    Image(.arrowBack)
                }
            }
        }
    }
}
