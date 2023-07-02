//
//  ContentView.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationSplitView {
            UserListView()
        } content: {
            PostListView()
        } detail: {
            PostDetailView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
