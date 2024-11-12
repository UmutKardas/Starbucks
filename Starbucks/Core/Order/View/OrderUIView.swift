//
//  OrderUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct OrderUIView: View {
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
                    ForEach(0 ... 4, id: \.self) { _ in
                        VStack {
                            OrderCellView()
                        }
                        .frame(width: screenWidth * 0.9, height: screenHeight * 0.1)
                        .background(.white)
                        .cornerRadius(5)
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

                    OrderAmountDetailView(title: "Price", amount: "$325", titleColor: .gray, amountColor: .gray)
                    OrderAmountDetailView(title: "Discount", amount: "$0", titleColor: .gray, amountColor: .gray)
                    OrderAmountDetailView(title: "Total", amount: "$325", titleColor: Color("greenColor"), amountColor: Color("greenColor"))
                }
                .padding(.bottom, screenHeight * 0.03)

            }.frame(maxWidth: screenWidth * 0.9)
        }
    }
}

#Preview {
    OrderUIView()
}
