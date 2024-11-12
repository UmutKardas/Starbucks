//
//  CustomNavigationHeader.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 7.11.2024.
//

import SwiftUI

struct CustomNavigationHeader: View {
    var title: String

    var body: some View {
        ZStack {
            HStack {
                Button {} label: {
                    Image(systemName: "arrow.left.circle")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.width * 0.06)
                }
                Spacer()
            }

            Text("\(title)")
                .font(.system(size: UIScreen.main.bounds.width * 0.045, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, UIScreen.main.bounds.width * 0.025)
        .padding(.top, UIScreen.main.bounds.height * 0.02)
    }
}
