//
//  EmailTFView.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import SwiftUI
import Combine

struct EmailTFView: View {
    
    @Binding var emailIsValid: Bool
    
    @State private var email = ""
    
    var title = ""
    var placeholder = ""
    
    private let emailPattern = #"^\S+@\S+\.\S+$"#
    
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.custom(Resources.Fonts.custom, fixedSize: 12))
                .foregroundStyle(Color(hex: "#A9ABB7"))
            
            TextField(placeholder, text: $email)
                .onReceive(Just(email)) { _ in
                    let result = email.range(
                        of: emailPattern,
                        options: .regularExpression
                    )
                    emailIsValid = result != nil ? true : false
                }
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
}
