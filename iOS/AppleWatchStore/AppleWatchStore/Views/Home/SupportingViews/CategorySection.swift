//
//  CategorySection.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/7/23.
//

import SwiftUI

struct CategorySection: View {
    var body: some View {
        VStack(spacing: 20) {
            SectionHeader(title: "Watch Accessories")
                .padding(.horizontal)
            
            VStack {
                ForEach(0 ..< 5) { item in
                    CategoryListItem()
                }
            }
        }
    }
}

#Preview {
    CategorySection()
}
