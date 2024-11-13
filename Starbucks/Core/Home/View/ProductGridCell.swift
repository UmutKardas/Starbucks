//
//  ProductGridCell.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 6.11.2024.
//

import SwiftUI

struct ProductGridCell: View {
    @State var isPresentingProductView: Bool = false

    var product: Product
    var imageHeight: CGFloat
    var gridHeight: CGFloat
    
    var body: some View {
        Button {
            isPresentingProductView = true
        } label: {
            VStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
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
        .frame(height: gridHeight)
        .background(Color.white)
        .cornerRadius(20)
        .fullScreenCover(isPresented: $isPresentingProductView) {
            ProductUIView(product: product)
                .navigationBarBackButtonHidden(true)
        }
    }
}
