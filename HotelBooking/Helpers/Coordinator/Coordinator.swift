//
//  Coordinator.swift
//  HotelBooking
//
//  Created by Denis on 12/23/23.
//

import SwiftUI

enum Page: String, Identifiable {
    case hotel, rooms, booking, success
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var navTitle: [Page: String] = [:]
    
    func push(_ page: Page, with title: String) {
        path.append(page)
        navTitle[page] = title
    }
    
    func pop(_ page: Page) {
        path.removeLast()
        navTitle.removeValue(forKey: page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
        navTitle.removeAll()
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .hotel:
            HotelView()
        case .rooms:
            RoomView(title: navTitle[.rooms] ?? "")
        case .booking:
            BookingView(title: navTitle[.booking] ?? "")
        case .success:
            SuccessView(title: navTitle[.success] ?? "")
        }
    }
}
