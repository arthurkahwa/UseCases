//
//  BrowseSection.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/7/23.
//

import SwiftUI

struct BrowseSection: View {
    var body: some View {
        VStack(spacing: 30) {
            SectionHeader(title: "Browse By Model")
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        CardView()
                            .frame(width: UIScreen.main.bounds.width - 20)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
            .safeAreaPadding(.horizontal, 10)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    BrowseSection()
}
