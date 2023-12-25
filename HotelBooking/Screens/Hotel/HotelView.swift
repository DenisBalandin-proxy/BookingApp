//
//  ContentView.swift
//  HotelBooking
//
//  Created by Denis on 12/19/23.
//

import SwiftUI

struct HotelView: View {
    
    @StateObject var viewModel = HotelViewModel()
    
    @EnvironmentObject private var coordinator: Coordinator
    
    //MARK: - body
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    VStack {
                        PhotosView(photos: viewModel.hotel?.imageUrls ?? [])
                            .frame(height: 257)
                        
                        MainHotelInfoView(
                            hotel: viewModel.prepareDataForMainInfoBlock()
                        )
                        
                        HStack(alignment: .bottom) {
                            Text("от \(viewModel.hotel?.minimalPrice.formatted(.number.locale(.init(identifier: "fr_FR"))) ?? "0") ₽")
                                .font(.custom(Resources.Fonts.customBold, fixedSize: 30))
                                .foregroundStyle(Color(hex: "#000000"))
                            
                            Text(viewModel.hotel?.priceForIt.lowercased() ?? "")
                                .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                                .foregroundStyle(Color(hex: "#828796"))
                            
                            Spacer()
                        }.padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                    .navigationTitle("Отель")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(
                        Color.white,
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .onAppear(perform: {
                        Task {
                            await viewModel.fetchData()
                        }
                    })
                    Spacer()
                }
                
                AboutHotelView(hotel: viewModel.hotel)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
            }.background(Color(hex: "#F6F6F9"))
            
            MainButtonView(buttonTitle: "К выбору номера")
                .background(.white)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            coordinator.push(
                                .rooms,
                                with: viewModel.hotel?.name ?? ""
                            )
                        }
                )
        }
    }
}
