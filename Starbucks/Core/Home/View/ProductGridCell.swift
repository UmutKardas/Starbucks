//
//  ProductGridCell.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct ProductGridCell: View {
    @Binding var isProductViewPresented: Bool
    var product: Product
    var imageHeight: CGFloat
    var gridHeight: CGFloat
    
    var body: some View {
        Button {
            isProductViewPresented = true
        } label: {
            VStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    // .frame(height: viewModel.getValueBasedOnIndex(index: index, minValue: 130, maxValue: 170))
                    .frame(height: imageHeight)
                
                Spacer()
                
                HStack {
                    Text("\(product.name)")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(.black)
                        .minimumScaleFactor(0.9)
                    
                    Spacer()
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundStyle(Color("greenColor"))
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
            }
        }
        // .frame(height: viewModel.getValueBasedOnIndex(index: index, minValue: 160, maxValue: 200))
        .frame(height: gridHeight)
        .background(Color.white)
        .cornerRadius(20)
        .fullScreenCover(isPresented: $isProductViewPresented) {
            ProductUIView(product: product)
        }
    }
}
