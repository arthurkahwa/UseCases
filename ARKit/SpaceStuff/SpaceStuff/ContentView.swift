//
//  ContentView.swift
//  SpaceStuff
//
//  Created by Arthur Nsereko Kahwa on 5/10/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State private var selectedItem: String? = "habitat"
    
    let items = ["habitat", "rover", "suit"]
    
    var body: some View {
        NavigationSplitView {
            List(items, id: \.self, selection: $selectedItem) { item in
                Text(item)
            }
            .navigationTitle("Kit List")
        } detail: {
            Container(viewModel: viewModel).edgesIgnoringSafeArea(.bottom)
                .onTapGesture(coordinateSpace: .global) { location in
                    print(String(describing: location))
                    if let selectedItem = selectedItem {
                        viewModel.makeRayCast(from: location, with: selectedItem)
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
