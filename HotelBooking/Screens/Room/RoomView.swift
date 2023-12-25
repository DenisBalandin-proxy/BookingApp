//
//  RoomView.swift
//  HotelBooking
//
//  Created by Denis on 12/20/23.
//

import SwiftUI

struct RoomView: View {
    
    @ObservedObject var viewModel = RoomsViewModel()
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var title = ""
    
    //MARK: - body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.rooms?.rooms ?? []) { room in
                    CellView(
                        room: room,
                        coordinator: coordinator,
                        hotelTitle: title
                    )
                }
                .background(.white)
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            Color.white,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(Color(hex: "#F6F6F9"))
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop(.rooms)
                }) {
                    Image(.arrowBack)
                }
            }
        }
        .onAppear(perform: {
            Task {
                await viewModel.fetchData()
            }
        })
    }
}
