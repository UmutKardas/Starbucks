//
//  OrderAmountDetailView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 12.11.2024.
//

import SwiftUI

struct OrderAmountDetailView: View {
    var title: String
    var amount: String

    var titleColor: Color
    var amountColor: Color

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(titleColor)

            Spacer()

            Text(amount)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(amountColor)
        }
    }
}
