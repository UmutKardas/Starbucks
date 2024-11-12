//
//  HomeUIView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 30.10.2024.
//

import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // MARK: - Header
                    
                    VStack {
                        HStack {
                            Text("Welcome 👋")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image("buyIcon")
                                .resizable()
                                .frame(width: 26, height: 26)
                        }
                        
                        Text("Let’s order and enjoy your order now.")
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, screenWidth * 0.08)
                    
                    // MARK: - Search Bar
                    
                    ZStack(alignment: .leading) {
                        HStack {
                            Image("searchIcon")
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                                .frame(width: 18, height: 18)
                            
                            TextField("Type something...", text: $viewModel.searchText)
                                .padding(10)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                            Spacer()
                            
                            Image("filterIcon")
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                                .frame(width: 18, height: 18)
                        }
                        .padding(8)
                        .padding(.horizontal, 15)
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, screenWidth * 0.08)
                    
                    // MARK: - Categories
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Menu {
                                Button("Popular", action: {})
                                Button("New", action: {})
                                Button("Best Seller", action: {})
                            } label: {
                                HStack {
                                    Text("Best Seller")
                                    Image(systemName: "chevron.down")
                                }
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.black)
                            }
                            ForEach(Category.allCases, id: \.self) { category in
                                Button {
                                    viewModel.selectedCategory = category
                                } label: {
                                    Text("\(category)")
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(viewModel.selectedCategory == category ? Color("greenColor") : .clear)
                                        .foregroundColor(viewModel.selectedCategory == category ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .cornerRadius(10)
                    .padding(.leading, screenWidth * 0.08)
                    
                    // MARK: - Products
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [.init(), .init()]) {
                            ForEach(Array(viewModel.selectedProducts.enumerated()), id: \.element.id) { _, product in
                                ProductGridCell(isProductViewPresented: $viewModel.isProductViewPresented, product: product, imageHeight: screenHeight * 0.15, gridHeight: screenHeight * 0.2)
                            }
                        }
                    }
                    .padding(.horizontal, screenWidth * 0.08)
                }
            }
        }
    }
}

#Preview {
    HomeUIView()
}
