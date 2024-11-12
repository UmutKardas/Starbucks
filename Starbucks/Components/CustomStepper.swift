//
//  CustomStepper.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Int

    var scaleFactor: CGFloat = 1

    var textColor: Color
    var textSecondaryColor: Color

    var backgroundColor: Color
    var backgroundSecondaryColor: Color

    var body: some View {
        HStack {
            Button(action: {
                value = max(value - 1, 0)
            }) {
                Text("-")
                    .font(.system(size: 24))
                    .foregroundColor(textSecondaryColor)
                    .padding(.horizontal, 15 * scaleFactor)
                    .padding(.vertical, 5 * scaleFactor)
                    .background(backgroundSecondaryColor)
                    .cornerRadius(10)
            }

            Text("\(value)")
                .foregroundStyle(textColor)
                .font(.system(size: 16, weight: .bold))
                .padding(.horizontal, 20 * scaleFactor)

            Button(action: {
                value += 1
            }) {
                Text("+")
                    .font(.system(size: 24))
                    .foregroundColor(textSecondaryColor)
                    .padding(.horizontal, 15 * scaleFactor)
                    .padding(.vertical, 5 * scaleFactor)
                    .background(backgroundSecondaryColor)
                    .cornerRadius(10)
            }
        }
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    CustomStepper(value: .constant(1), textColor: Color("greenColor"), textSecondaryColor: .white, backgroundColor: Color("grayColor"), backgroundSecondaryColor: Color("greenColor"))
        .frame(maxWidth: .infinity)
}
