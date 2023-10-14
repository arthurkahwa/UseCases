//
//  FavoritesView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/8/23.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 70) {
                    ForEach(0 ..< 3) { item in
                        NavigationLink {} label: {
                            WideProductItem()
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 60)
            }
            .background(Color.baseBackground)
            .navigationTitle("MY FAVORITES")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FavoritesView()
}
