//
//  ContentView.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("") {
                    VStack {
                        
                        HStack {
                            Spacer()
                            
                            Image(systemName: loginViewModel.userIsAuthenticated ?
                                  "lock.fill" : "lock.open.fill")
                            .resizable()
                            .frame(width: 64, height: 72, alignment: .leading)
                            .foregroundColor(loginViewModel.userIsAuthenticated ?
                                .green : .orange)
                            .padding()
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text(loginViewModel.userIsAuthenticated ?
                                 "Logged in." : "Not logged in.")
                            .font(.largeTitle)
                            
                            Spacer()
                        }
                    }
                }
                
                if !loginViewModel.userIsAuthenticated {
                    Section {
                        VStack {
                            TextField("Username", text: $loginViewModel.username)
                                .font(.title)
                            
                            SecureField("Password", text: $loginViewModel.password)
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
                            if !loginViewModel.userIsAuthenticated {
                                loginViewModel.login()
                            }
                            
                            loginViewModel.logout()
                        } label: {
                            Text(loginViewModel.userIsAuthenticated ?
                                 "Logout" : "Login")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        }
                        .frame(width: 160, height: 58, alignment: .center)
                        .foregroundColor(.white)
                        .background(loginViewModel.userIsAuthenticated ?
                            .orange : .cyan)
                        .padding()
                        
                        Spacer()
                    }
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
