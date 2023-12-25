//
//  TourestTFView.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import SwiftUI
import Combine

struct TouristTFView: View {
    
    @Binding var text: String
    @Binding var checkValidation: Bool
    
    @State private var showTitle = false
    
    var placeholder = ""
    
    //MARK: - body
    var body: some View {
        ZStack(alignment: .leading) {
            
            if !showTitle {
                Text(placeholder)
                    .font(.custom(Resources.Fonts.custom, fixedSize: 17))
                    .foregroundStyle(Color(hex: "#A9ABB7"))
            }
            VStack(alignment: .leading) {
                
                if showTitle {
                    Text(placeholder)
                        .font(.custom(Resources.Fonts.custom, fixedSize: 12))
                        .foregroundStyle(Color(hex: "#A9ABB7"))
                }
                TextField("", text: $text)
                    .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                    .foregroundStyle(Color(hex: "#14142B"))
                    .onReceive(Just(text)) { _ in
                        withAnimation {
                            showTitle = !text.isEmpty ? true: false
                        }
                    }
            }
        }
        .padding()
        .frame(height: 52)
        .background(
            (checkValidation && !text.isEmpty) ||
            (!checkValidation) ?
            Color(hex: "#F6F6F9") :
                Color(hex: "#EB5757")
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12
            )
        )
    }
}
