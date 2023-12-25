//
//  CustomerInfoView.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import SwiftUI

struct CustomerInfoView: View {
    
    @Binding var emailIsValid: Bool
    @Binding var checkValidation: Bool
    @Binding var phoneIsValid: Bool
    
    var booking: Booking?
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack {
                    Text("Информация о покупателе")
                        .font(.custom(Resources.Fonts.custom, fixedSize: 22))
                    
                    Spacer()
                }
                PhoneTFView(phoneIsValid: $phoneIsValid, title: "Номер телефона", placeholder: "")
                    .background(
                        (checkValidation && phoneIsValid) ||
                        (!checkValidation) ?
                        Color(hex: "#F6F6F9") :
                            Color(hex: "#EB5757")
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                
                EmailTFView(
                    emailIsValid: $emailIsValid,
                    title: "Почта",
                    placeholder: "example@gmail.com"
                )
                .background(
                    (checkValidation && emailIsValid) ||
                    (!checkValidation) ?
                    Color(hex: "#F6F6F9") :
                        Color(hex: "#EB5757")
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                )
                
                Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                    .foregroundStyle(Color(hex: "#828796"))
                    .font(.custom(Resources.Fonts.custom, fixedSize: 14))
            }
            .padding()
            .background(.white)
        }
    }
}
