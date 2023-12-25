//
//  PhotosView.swift
//  HotelBooking
//
//  Created by Denis on 12/19/23.
//

import SwiftUI

struct PhotosView: View {
    
    @State private var selection = 0
    
    var photos: [String] = []
    
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                TabView(selection : $selection) {
                    ForEach(photos.indices, id: \.self) { index in
                        AsyncImage(url: URL(string: photos[index])) { image in
                            image
                                .image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width - 32, height: 257)
                                .clipped()
                        }
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                        )
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }.tabViewStyle(.page(indexDisplayMode: .never))
                    .overlay(
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 75, height: 17)
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 5
                                        )
                                    )
                                HStack(spacing: 5) {
                                    ForEach(photos.indices, id: \.self) { index in
                                        Circle()
                                            .fill(index == selection ? .black : .gray)
                                            .frame(width: 7, height: 7)
                                    }
                                }
                            }
                        }.padding(.bottom, 8)
                    )
            }
        }
    }
}

