//
//  WifiCellularView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/16/23.
//

import SwiftUI

struct WifiCellularView: View {
    var body: some View {
        HStack {
            Image(.iconWifi)
            
            HStack {
                Image(systemName: "plus")
                
                Image(.icon5G)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 80)
        .padding()
    }
}

#Preview {
    WifiCellularView()
}
