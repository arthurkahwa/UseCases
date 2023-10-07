//
//  ContentView.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Products")
                .tabItem {
                    Label("Products", systemImage: "applewatch")
                }
            
            Text("Bag")
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContentView()
}
