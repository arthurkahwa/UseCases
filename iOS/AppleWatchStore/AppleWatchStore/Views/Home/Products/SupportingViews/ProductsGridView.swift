//
//  ProductsGridView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/8/23.
//

import SwiftUI

struct ProductsGridView: View {
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: Constants.columns, spacing: 16) {
                    ForEach(0 ..< 12) { _ in
                        NavigationLink {} label: {
                            GridProductItem()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.top, 2)
        }
    }
}

#Preview {
    NavigationStack {
        ProductsGridView()
    }
}
