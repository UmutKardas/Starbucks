//
//  CustomViewButton.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct CustomViewButton: View {
    var title: String
    var textColor: Color = .white
    var backgroundColor: Color = .init("greenColor")
    var height: CGFloat = UIScreen.main.bounds.width * 0.03
    var cornerRadius: CGFloat = 10
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(textColor)
                .font(.headline)
                .fontWeight(.medium)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity)
                .padding(.vertical, height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}

#Preview {
    CustomViewButton(title: "Order Now") {
        print("Order Now tapped")
    }
}
