//
//  ContentView.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("") {
                    VStack {
                        
                        HStack {
                            Spacer()
                            
                            Image(systemName: viewModel.userIsAuthenticated ?
                                  "lock.fill" : "lock.open.fill")
                            .resizable()
                            .frame(width: 64, height: 72, alignment: .leading)
                            .foregroundColor(viewModel.userIsAuthenticated ?
                                .green : .orange)
                            .padding()
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text(viewModel.userIsAuthenticated ?
                                 "Logged in." : "Not logged in.")
                            .font(.largeTitle)
                            
                            Spacer()
                        }
                    }
                }
                
                if !viewModel.userIsAuthenticated {
                    Section {
                        VStack {
                            TextField("Username", text: $viewModel.username)
                                .font(.title)
                            
                            SecureField("Password", text: $viewModel.password)
                                .font(.title)
                        }
                    }
                }
                else {
                    Section {
                        NavigationLink {
                            UserListView()
                        } label: {
                            Button {}
                            label: {
                                Text("Find Users")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        }
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        
                        Button {
                            if viewModel.userIsAuthenticated {
                                viewModel.logout()
                                
                            }
                            else {
                                viewModel.login()
                            }
                        } label: {
                            Text(viewModel.userIsAuthenticated ?
                                 "Logout" : "Login")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        }
                        .frame(width: 160, height: 58, alignment: .center)
                        .foregroundColor(.white)
                        .background(viewModel.userIsAuthenticated ?
                            .orange : .cyan)
                        .padding()
                        
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .environmentObject(viewModel)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
