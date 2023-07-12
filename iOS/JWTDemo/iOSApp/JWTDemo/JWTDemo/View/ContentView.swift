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
                                .green : .red)
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
            
            Section {
                VStack {
                    TextField("Username", text: $loginViewModel.username)
                        .font(.title)
                    
                    SecureField("Password", text: $loginViewModel.password)
                        .font(.title)
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    
                    Button {
                        loginViewModel.login()
                    } label: {
                        Text("Login")
                            .font(.title)
                            .padding()
                    }
                    .frame(width: 160, height: 58, alignment: .center)
                    .foregroundColor(.white)
                    .background(.cyan)
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
