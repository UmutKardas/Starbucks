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

    var product: Product

    var body: some View {
        HStack {
            Image("\(product.image)")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth * 0.2, height: screenHeight * 0.1)

            VStack {
                HStack {
                    Text("\(product.name)")
                        .font(.system(size: screenWidth * 0.045, weight: .regular))
                    Spacer()

                    Text("$\(product.price * Double(product.count), specifier: "%.2f")")
                        .foregroundStyle(Color("greenColor"))
                        .font(.system(size: screenWidth * 0.05, weight: .regular))
                }

                Spacer()

                HStack {
                    CustomStepper(value: .constant(product.count), scaleFactor: 0.4, textColor: .black, textSecondaryColor: .black, backgroundColor: Color("grayColor"), backgroundSecondaryColor: Color("grayColor"))

                    Spacer()

                    Menu {
                        Button("Grande", action: {})
                        Button("Venti", action: {})
                        Button("Tall", action: {})
                    } label: {
                        HStack {
                            Text("\(product.size.rawValue)")
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(3)

                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, screenWidth * 0.03)
                        .padding(.vertical, screenHeight * 0.006)
                        .font(.system(size: screenWidth * 0.04, weight: .regular))
                        .foregroundColor(.black)
                        .background(Color("grayColor"))
                        .cornerRadius(screenWidth * 0.025)
                    }

                    Spacer()
                }
            }
            .padding(.horizontal, screenWidth * 0.05)
            .padding(.vertical, screenHeight * 0.02)
        }
    }
}

#Preview {
    OrderCellView(product: Product(name: "Breakfast 2", price: 20.99, about: "An energizing breakfast meal to keep you going all day.", image: "breakfast", category: .Breakfast))
}
