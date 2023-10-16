//
//  SizeItem.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/16/23.
//

import SwiftUI

struct SizeItem: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("49 mm")
                .condensed(.bold, size: 24)
            
            Spacer()
            
            Group {
                Text("€").ultraLight() +
                Text("999").heavy()
            }
        }
        .padding()
    }
}

#Preview {
    SizeItem()
}
