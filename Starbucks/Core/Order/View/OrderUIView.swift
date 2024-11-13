//
//  OrderUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct OrderUIView: View {
    @StateObject var viewModel: OrderViewModel = .init()
    @Environment(\.dismiss) var dismiss

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()

            VStack {
                CustomNavigationHeader(title: "Your Order")

                Spacer()

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.orders, id: \.self) { product in
                        OrderCellView(product: product)
                            .frame(width: screenWidth * 0.9, height: screenHeight * 0.1)
                            .background(.white)
                            .cornerRadius(8)
                            .padding(.bottom, screenHeight * 0.01)
                    }
                }
                .padding(.top, screenHeight * 0.03)

                Spacer()

                VStack(spacing: screenHeight * 0.01) {
                    HStack {
                        Image("walletIcon")
                            .renderingMode(.template)
                            .foregroundColor(Color("greenColor"))

                        Text("Amount Details")
                            .font(.system(size: 15, weight: .regular))

                        Spacer()
                    }

                    OrderAmountDetailView(title: "Price", amount: "$\(viewModel.totalPrice())", titleColor: .gray, amountColor: .gray)
                    OrderAmountDetailView(title: "Discount", amount: "$0", titleColor: .gray, amountColor: .gray)
                    OrderAmountDetailView(title: "Total", amount: "$\(viewModel.totalPrice())", titleColor: Color("greenColor"), amountColor: Color("greenColor"))

                    HStack {
                        Spacer()

                        CustomViewButton(title: "Pay now", textColor: Color.white, backgroundColor: Color("greenColor")) {
                            viewModel.attemptPayment()
                        }
                        .frame(maxWidth: screenWidth * 0.5)
                    }
                    .padding(.top, screenHeight * 0.02)
                }
                .padding(.bottom, screenHeight * 0.01)

            }.frame(maxWidth: screenWidth * 0.9)
        }
        .fullScreenCover(isPresented: $viewModel.isPaymentViewPresented) {
            PaymentUIView()
        }
    }
}

#Preview {
    OrderUIView()
}
