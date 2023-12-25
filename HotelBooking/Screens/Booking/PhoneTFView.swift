//
//  TextFieldView.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import SwiftUI
import Combine

struct PhoneTFView: View {
    
    @State var mask = "+7(***)***-**-**"
    @Binding var phoneIsValid: Bool
    
    @State private var phoneNumber = ""
    @State private var isEditingTF = false
    
    var title = ""
    var placeholder = ""
    
    var edit: Bool {
        isEditingTF || !phoneNumber.isEmpty
    }
    
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.custom(Resources.Fonts.custom, fixedSize: 12))
                .foregroundStyle(Color(hex: "#A9ABB7"))
            HStack {
                ZStack(alignment: .leading) {
                    Text(mask)
                        .font(.custom(Resources.Fonts.custom, fixedSize: 16))
                        .foregroundStyle( edit ? .black : Color(hex: "#A9ABB7"))
                    TextField("", text: $phoneNumber, onEditingChanged: { editing in
                        isEditingTF = editing ? true : false
                    })
                    .tint(.clear)
                    .foregroundStyle(.clear)
                    .keyboardType(.numbersAndPunctuation)
                    .onReceive(Just(phoneNumber)) { _ in
                        formatPhoneNumber(string: phoneNumber)
                        phoneIsValid = !mask.contains("*")
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
    
    private func formatPhoneNumber(string: String) {
        let numbers = string.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        var maskChars = Array("+7(***)***-**-**")
        let chars = Array(numbers)
        
        if chars.isEmpty {
            mask = String(maskChars)
        }
        
        for char in chars {
            for maskChar in maskChars {
                if maskChar == "*" {
                    guard let i = maskChars.firstIndex(of: maskChar) else { return }
                    maskChars[i] = char
                    break
                }
            }
        }
        mask = String(maskChars)
    }
}
