//
//  CustomPicker.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import SwiftUI

struct CustomSizePicker: View {
    @Binding var selected: CoffeeSize

    var body: some View {
        HStack {
            ForEach(CoffeeSize.allCases, id: \.self) { size in
                Button(action: {
                    selected = size
                }) {
                    Text(size.rawValue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selected == size ? Color("greenColor") : Color.clear)
                        .foregroundColor(selected == size ? Color.white : Color.black)
                        .cornerRadius(10)
                        .shadow(color: selected == size ? Color.black.opacity(0.3) : Color.clear, radius: 2, x: 0, y: 1)
                }
            }
        }
        .background(Color("grayColor"))
        .cornerRadius(10)
    }
}

#Preview {
    CustomSizePicker(selected: .constant(.Tall))
}
