//
//  WristSizesView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/16/23.
//

import SwiftUI

struct WristSizesView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "WRIST SIZES")
                .padding(.bottom)
            
            ForEach(0 ..< 3) { item in
                Button(action: {}) {
                    WristItem()
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.baseMediumGrey, lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WristSizesView()
}
