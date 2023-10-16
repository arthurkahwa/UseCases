//
//  WristItem.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/16/23.
//

import SwiftUI

struct WristItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Large")
                .condensedLowercased(.bold, size: 24)
            
            Text("Fits 165 - 210 mm wrist")
                .condensed(.light, size: 16)
        }
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
        .frame(height: 80)
        .padding()
    }
}

#Preview {
    WristItem()
}
