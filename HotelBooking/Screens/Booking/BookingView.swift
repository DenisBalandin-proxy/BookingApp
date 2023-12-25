//
//  BookingView.swift
//  HotelBooking
//
//  Created by Denis on 12/21/23.
//

import SwiftUI

struct BookingView: View {
    
    @ObservedObject var viewModel = BookingViewModel()
    
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var tourists: [Tourist] = []
    @State private var checkValidation = false
    @State private var phoneIsValid = false
    @State private var emailIsValid = false
    
    var title = ""
    
    private let numberOfTourist = ["Первый",
                                   "Второй",
                                   "Третий",
                                   "Четвёртый",
                                   "Пятый",
                                   "Шестой",
                                   "Седьмой"]
    
    private var isValid: () -> Bool {
        {
            if tourists.isEmpty || !emailIsValid || !phoneIsValid {
                return false
            }
            for tourist in tourists {
                if !tourist.isValid() {
                    return false
                }
            }
            return true
        }
    }
    
    //MARK: - body
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8) {
                    MainHotelInfoView(
                        hotel: viewModel.prepareDataForMainInfoBlock()
                    )
                    .padding(EdgeInsets(
                        top: 16,
                        leading: 0,
                        bottom: 16,
                        trailing: 0)
                    )
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                    BookingInfoView(booking: viewModel.booking)
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12
                            )
                        )
                    CustomerInfoView(
                        emailIsValid: $emailIsValid,
                        checkValidation: $checkValidation,
                        phoneIsValid: $phoneIsValid,
                        booking: viewModel.booking
                    )
                    
                    if !tourists.isEmpty {
                        ForEach(0...tourists.count - 1, id: \.self) { number in
                            TouristInfoView(
                                checkValidation: $checkValidation,
                                tourist: $tourists[number],
                                numberOfTourist: numberOfTourist[number]
                            )
                            .background(.white)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 12
                                )
                            )
                        }
                    }
                    AddTouristButtonView(
                        tourists: $tourists,
                        checkValidationd: $checkValidation
                    )
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                    TourAmountView(
                        booking: viewModel.booking,
                        payment: viewModel.payment
                    )
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                }
                .padding(EdgeInsets(
                    top: 8,
                    leading: 0,
                    bottom: 8,
                    trailing: 0)
                )
            }
            .background(Color(hex: "#F6F6F9"))
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            Color.white,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop(.booking)
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
        
        if isValid() {
            MainButtonView(buttonTitle: "Оплатить \(viewModel.payment)")
                .background(.white)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            coordinator.push(.success, with: "Заказ оплачен")
                        }
                )
        } else {
            MainButtonView(buttonTitle: "Оплатить \(viewModel.payment)")
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            checkValidation = true
                        }
                )
                .background(.white)
        }
    }
}
