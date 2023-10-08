//
//  FilterSectionView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/8/23.
//

import SwiftUI

struct FilterSectionView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "SECTION TITLE HERE")
            
            LazyVGrid(columns: Constants.filterColumns, spacing: 10) {
                ForEach(0 ..< 5) { item in
                    sectionItem
                }
            }
        }
        .padding(.horizontal)
    }
    
    var sectionItem: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 24, height: 24)
                
                Image(.iconCheckmark)
            }
            
            Text("Title goes here")
                .condensed(.regular, size: 16)
            
            Spacer()
        }
    }
}

#Preview {
    FilterSectionView()
}
