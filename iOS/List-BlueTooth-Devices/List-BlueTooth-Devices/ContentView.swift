//
//  ContentView.swift
//  List-BlueTooth-Devices
//
//  Created by Arthur Nsereko Kahwa on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BluetoothViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.peripheralSet.sorted(by: { lhs, rhs in
                lhs.identifier.uuidString > rhs.identifier.uuidString
            }), id: \.self) { peripheral in
               VStack(alignment: .leading) {
                    if let name = peripheral.name {
                        Text(name)
                            .fontWeight(.bold)
                    }
                    else {
                        Text(peripheral.identifier.uuidString)
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("Device List")
        }
    }
}

#Preview {
    ContentView()
}
