//
//  UserListView.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedUser: User?
    
    var body: some View {
        ZStack {
            if viewModel.userListLoading {
                ProgressView {
                    Text("Loading User List")
                        .font(.largeTitle)
                }
            }
            else {
                VStack(alignment: .leading) {
                    Text("User List")
                        .font(.title)
                        .padding()
                    
                    List(viewModel.userList, id: \.id, selection: $selectedUser) { user in
                        VStack {
                            Text(user.username)
                                .font(.headline)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.findUserList()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    
    static var previews: some View {
        UserListView(selectedUser: .constant(User(id: 42, username: "PreviewUserName", email: "preview@mail.local")))
    }
}
