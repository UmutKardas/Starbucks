//
//  OrderCellView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 12.11.2024.
//

import SwiftUI

struct OrderCellView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        HStack {
            Image("fantasyTail")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth * 0.2, height: screenHeight * 0.1)

            VStack {
                HStack {
                    Text("Frappucino")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()

                    Text("$35")
                        .foregroundStyle(Color("greenColor"))
                        .font(.system(size: 20, weight: .regular))
                }

                Spacer()

                HStack {
                    CustomStepper(value: .constant(0), scaleFactor: 0.5, textColor: .black, textSecondaryColor: .black, backgroundColor: Color("grayColor"), backgroundSecondaryColor: Color("grayColor"))

                    Spacer()

                    Menu {
                        Button("Grande", action: {})
                        Button("Venti", action: {})
                        Button("Tall", action: {})
                    } label: {
                        HStack {
                            Text("Grande")
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                        .background(Color("grayColor"))
                        .cornerRadius(10)
                    }

                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}
