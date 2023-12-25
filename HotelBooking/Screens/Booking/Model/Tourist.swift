//
//  Tourist.swift
//  HotelBooking
//
//  Created by Denis on 12/22/23.
//

import Foundation

struct Tourist {
    var name: String
    var lastName: String
    var dateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var passportValidityPeriod: String
    
    func isValid() -> Bool {
        !name.isEmpty &&
        !lastName.isEmpty &&
        !dateOfBirth.isEmpty &&
        !citizenship.isEmpty &&
        !passportNumber.isEmpty &&
        !passportValidityPeriod.isEmpty
    }
}
