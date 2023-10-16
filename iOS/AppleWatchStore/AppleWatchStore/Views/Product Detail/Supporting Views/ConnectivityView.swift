//
//  ConnectivityView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/16/23.
//

import SwiftUI

struct ConnectivityView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "Connectivity")
            
            HStack {
                ForEach(0 ..< 2) { item in
                    Button(action: {}) {
                        WifiCellularView()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.baseMediumGrey, lineWidth: 1)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    ConnectivityView()
}
