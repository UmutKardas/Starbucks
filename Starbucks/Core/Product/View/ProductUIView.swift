//
//  ProductUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import SwiftUI

struct ProductUIView: View {
    @StateObject var viewModel: ProductViewModel = .init()
    @Environment(\.dismiss) var dismiss
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var product: Product
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Top
                
                VStack(spacing: -screenHeight * 0.01) {
                    CustomNavigationHeader(title: viewModel.product?.name ?? "")
                    
                    // MARK: - Image
                    
                    Image("productImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.85, height: screenHeight * 0.5)
                    
                    // MARK: - Details
                    
                    VStack(spacing: screenHeight * 0.03) {
                        HStack {
                            Text("\(viewModel.product?.about ?? "")")
                                .font(.system(size: screenWidth * 0.04, weight: .light))
                                .multilineTextAlignment(.leading)
                            
                            Text("$\(viewModel.product?.price ?? 0.2, specifier: "%.2f")")
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
                                CustomStepper(value: $viewModel.count, textColor: Color("greenColor"), textSecondaryColor: .white, backgroundColor: Color("grayColor"), backgroundSecondaryColor: Color("greenColor"))
                                
                                Spacer()
                                
                                Text("$\(String(format: "%.2f", (viewModel.product?.price ?? 0) * Double(viewModel.count)))")
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

                            CustomSizePicker(selected: $viewModel.selectedSize)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.top, screenHeight * 0.02)
                    
                    // MARK: - Order Button

                    HStack {
                        CustomViewButton(title: "Add to card", textColor: Color("greenColor"), backgroundColor: Color.clear) {
                            print("Add to card")
                        }
                        CustomViewButton(title: "Order Now", textColor: .white, backgroundColor: Color("greenColor")) {
                            viewModel.addOrder()
                            dismiss()
                        }
                    }
                    .background(Color("grayColor"))
                    .cornerRadius(10)
                    .padding(.top, screenHeight * 0.04)
                }
                
                Spacer()
                
            }.frame(maxWidth: screenWidth * 0.9)
        }
        .onAppear {
            viewModel.product = product
        }
    }
}

#Preview {
    ProductUIView(product: Product(name: "Breakfast 2", price: 20.99, about: "An energizing breakfast meal to keep you going all day.", image: "breakfast", category: .Breakfast)
    )
}
