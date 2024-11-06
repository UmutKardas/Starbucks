//
//  MainTabBarView.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 30.10.2024.
//

import SwiftUI

import SwiftUI

struct MainTabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Spacer()

                ZStack {
                    switch selectedTab {
                    case 0:
                        HomeUIView()
                    case 1:
                        WalletUIView()
                    case 2:
                        TicketUIView()
                    case 3:
                        LocationUIView()
                    case 4:
                        ProfileUIView()
                    default:
                        HomeUIView()
                    }
                }

                Spacer()

                HStack {
                    TabBarIcon(iconName: "homeIcon", tabIndex: 0, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "walletIcon", tabIndex: 1, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "ticketIcon", tabIndex: 2, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "locationIcon", tabIndex: 3, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "profileIcon", tabIndex: 4, selectedTab: $selectedTab)
                }
                .padding()
                .background(Color.white)
            }
        }
    }
}

struct TabBarIcon: View {
    let iconName: String
    let tabIndex: Int
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Image(iconName)
                .renderingMode(.template)
                .foregroundColor(selectedTab == tabIndex ? Color("greenColor") : .black)

            Rectangle()
                .frame(height: 3)
                .foregroundColor(selectedTab == tabIndex ? Color("greenColor") : .clear)
                .padding(.top, 5)
                .padding(.horizontal, 15)
        }
        .onTapGesture {
            selectedTab = tabIndex
        }
    }
}

#Preview {
    MainTabBarView()
}
