//
//  TouristInfoView.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import SwiftUI

struct TouristInfoView: View {
    
    @Binding var checkValidation: Bool
    @Binding var tourist: Tourist
    
    @State private var text = ""
    @State private var droppedDown = true
    
    var numberOfTourist = ""
    var placeholder = ""
    
    //MARK: - body
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("\(numberOfTourist) турист")
                    .font(.custom(Resources.Fonts.customBold, fixedSize: 22))
                Spacer()
                Button() {
                    withAnimation(.linear(duration: 0.3)) {
                        droppedDown.toggle()
                    }
                } label: {
                    Image(.touristInfo)
                        .rotationEffect(.degrees(droppedDown ? 0 : 180))
                }
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            
            VStack {
                if !droppedDown {
                    VStack {
                        TouristTFView(
                            text: $tourist.name,
                            checkValidation: $checkValidation,
                            placeholder: "Имя"
                        )
                        TouristTFView(
                            text: $tourist.lastName,
                            checkValidation: $checkValidation,
                            placeholder: "Фамилия"
                        )
                        TouristTFView(
                            text: $tourist.dateOfBirth,
                            checkValidation: $checkValidation,
                            placeholder: "Дата рождения"
                        )
                        TouristTFView(
                            text: $tourist.citizenship,
                            checkValidation: $checkValidation,
                            placeholder: "Гражданство"
                        )
                        TouristTFView(
                            text: $tourist.passportNumber,
                            checkValidation: $checkValidation,
                            placeholder: "Номер загранпаспорта"
                        )
                        TouristTFView(
                            text: $tourist.passportValidityPeriod,
                            checkValidation: $checkValidation,
                            placeholder: "Срок действия загранпаспорта"
                        )
                    }
                    .hidden()
                } else{
                    VStack {
                        TouristTFView(
                            text: $tourist.name,
                            checkValidation: $checkValidation,
                            placeholder: "Имя"
                        )
                        TouristTFView(
                            text: $tourist.lastName,
                            checkValidation: $checkValidation,
                            placeholder: "Фамилия"
                        )
                        TouristTFView(
                            text: $tourist.dateOfBirth,
                            checkValidation: $checkValidation,
                            placeholder: "Дата рождения"
                        )
                        TouristTFView(
                            text: $tourist.citizenship,
                            checkValidation: $checkValidation,
                            placeholder: "Гражданство"
                        )
                        TouristTFView(
                            text: $tourist.passportNumber,
                            checkValidation: $checkValidation,
                            placeholder: "Номер загранпаспорта"
                        )
                        TouristTFView(
                            text: $tourist.passportValidityPeriod,
                            checkValidation: $checkValidation,
                            placeholder: "Срок действия загранпаспорта"
                        )
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
            }
            .frame(height: droppedDown ? 376 : 0)
        }
    }
}
