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
    @State private var selectedUser: User?

    var body: some View {
        NavigationSplitView {
            UserListView(selectedUser: $selectedUser)
                .navigationTitle("User List")
        } content: {
            PostListView()
        } detail: {
            PostDetailView()
        }
        .environmentObject(viewModel)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
