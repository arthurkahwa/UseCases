//
//  LoginViewModel.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    var username = ""
    var password = ""
    let userDefaults = UserDefaults.standard
    let TOKEN_KEY = "jsonWebToken"
    @Published var userIsAuthenticated = false
    @Published var userAccounts: [UserDetail] = []
    
    func login() {
        Task {
            switch await ApiService().login(with: username, and: password) {
            case .success(let token):
                userDefaults.setValue(token, forKey: TOKEN_KEY)
                userIsAuthenticated = true
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func logout() {
        
    }
    
    func findAllUserAccounts() {
        Task {
            if let token = userDefaults.string(forKey: TOKEN_KEY) {
                switch await ApiService().findAllAccounts(using: token) {
                case .success(let accounts):
                    userAccounts = accounts
                    
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
    }
}
