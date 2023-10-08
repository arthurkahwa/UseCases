//
//  ProductsView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/8/23.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("APPLE WATCHES")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    var content: some View {
        ProductsGridView()
    }
}

#Preview {
    ProductsView()
}
