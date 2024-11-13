//
//  PaymentUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct PaymentUIView: View {
    @Environment(\.dismiss) var dismiss

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()

            VStack {
                Text("Payment Success!")
                    .font(.title2)
                    .fontWeight(.medium)

                Image("paymentSuccess")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)

                Text("Your payment has been successfully processed, your order is being prepared.")
                    .font(.system(size: UIScreen.main.bounds.width * 0.04, weight: .regular))
                    .multilineTextAlignment(.center)

                CustomViewButton(title: "Okay", textColor: .white, backgroundColor: Color("greenColor"), height: UIScreen.main.bounds.width * 0.04) {
                    dismiss()
                }
                .padding(.top, screenHeight * 0.05)
            }
            .frame(maxWidth: screenWidth * 0.7)
        }
    }
}

#Preview {
    PaymentUIView()
}
