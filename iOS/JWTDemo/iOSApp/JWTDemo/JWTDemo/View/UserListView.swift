//
//  UserListView.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var selectedUser: UserDetail?
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List(viewModel.userAccounts,
                     id: \.self,
                     selection: $selectedUser) { user in
                    Text(user.name)
                        .font(.title3)
                }
            }
            .navigationTitle("Users")
        } detail: {
            UserDetailView(selectedUser: $selectedUser)
        }
        .task {
            await viewModel.findAllUserAccounts()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
