//
//  ProductUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import SwiftUI

struct ProductUIView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    @State var count: Int = 1
    @State var selectedSize: CoffeeSize = .Tall
    
    var product: Product
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Top
                
                VStack(spacing: -screenHeight * 0.01) {
                    ZStack {
                        HStack {
                            Button {} label: {
                                Image(systemName: "arrow.left.circle")
                                    .resizable()
                                    .foregroundStyle(.black)
                                    .frame(width: screenWidth * 0.06, height: screenWidth * 0.06)
                            }
                            Spacer()
                        }
                        
                        Text("\(product.name)")
                            .font(.system(size: screenWidth * 0.045, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.horizontal, screenWidth * 0.025)
                    .padding(.top, screenHeight * 0.02)
                    
                    // MARK: - Image
                    
                    Image("productImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.85, height: screenHeight * 0.5)
                    
                    // MARK: - Details
                    
                    VStack(spacing: screenHeight * 0.03) {
                        HStack {
                            Text("Lorem ipsum is simply dummy text of the printing and typesetting.")
                                .font(.system(size: screenWidth * 0.04, weight: .light))
                            
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.system(size: screenWidth * 0.05, weight: .bold))
                                .foregroundStyle(Color("greenColor"))
                                .padding(screenWidth * 0.025)
                                .background(Color("grayColor"))
                                .cornerRadius(screenWidth * 0.025)
                        }
                        
                        Divider()
                    }
                    
                    // MARK: - Product Options
                    
                    VStack(spacing: screenHeight * 0.02) {
                        VStack(spacing: screenHeight * 0.015) {
                            Text("Quantity")
                                .font(.system(size: screenWidth * 0.04, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            HStack {
                                CustomStepper(value: $count)
                                
                                Spacer()
                                
                                Text("$\(product.price * Double(count), specifier: "%.2f")")
                                    .font(.system(size: screenWidth * 0.05, weight: .bold))
                                    .foregroundStyle(Color("greenColor"))
                                    .padding(screenWidth * 0.025)
                                    .background(Color("grayColor"))
                                    .cornerRadius(screenWidth * 0.025)
                            }
                        }
                        
                        VStack(spacing: screenHeight * 0.015) {
                            Text("Size")
                                .font(.system(size: screenWidth * 0.04, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            CustomSizePicker(selected: $selectedSize)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.top, screenHeight * 0.02)
                    
                    // MARK: - Order Button

                    HStack {
                        CustomViewButton(title: "Add to card", textColor: Color("greenColor"), backgroundColor: Color.clear) {
                            print("Order Now")
                        }
                        CustomViewButton(title: "Order Now", textColor: .white, backgroundColor: Color("greenColor")) {
                            print("Order Now")
                        }
                    }
                    .background(Color("grayColor"))
                    .cornerRadius(10)
                    .padding(.top, screenHeight * 0.04)
                }
                
                Spacer()
                
            }.frame(maxWidth: screenWidth * 0.9)
        }
    }
}

#Preview {
    ProductUIView(product: Product(name: "Fantasy Tail", price: 6.99, image: "rainbow", category: .Frappuccino))
}
