//
//  AddTouristButtonView.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import SwiftUI

struct AddTouristButtonView: View {
    
    @Binding var tourists: [Tourist]
    @Binding var checkValidationd: Bool
    
    //MARK: - body
    var body: some View {
        HStack {
            Text("Добавить туриста")
                .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
            
            Spacer()
            
            Button() {
                checkValidationd = false
                tourists.append(
                    Tourist(
                        name: "",
                        lastName: "",
                        dateOfBirth: "",
                        citizenship: "",
                        passportNumber: "",
                        passportValidityPeriod: ""
                    )
                )
            } label: {
                Image(.addButton)
            }
        }
        .padding(.all, 16)
    }
}
