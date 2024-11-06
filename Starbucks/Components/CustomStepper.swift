//
//  CustomStepper.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Int

    var body: some View {
        HStack {
            Button(action: {
                value = max(value - 1, 0)
            }) {
                Text("-")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(Color("greenColor"))
                    .cornerRadius(10)
            }

            Text("\(value)")
                .font(.system(size: 16, weight: .bold))
                .padding(.horizontal, 20)

            Button(action: {
                value += 1
            }) {
                Text("+")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(Color("greenColor"))
                    .cornerRadius(10)
            }
        }
        .background(Color("grayColor"))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
