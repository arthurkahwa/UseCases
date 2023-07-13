//
//  LoginViewModel.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
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
        username = ""
        password = ""
        
        userDefaults.removeObject(forKey: TOKEN_KEY)
        userIsAuthenticated = false
    }
    
    func findAllUserAccounts() async {
        if let token = userDefaults.string(forKey: TOKEN_KEY) {
            switch await ApiService().findUserAccounts(using: token) {
            case .success(let accounts):
                userAccounts = accounts
                print(String(describing: userAccounts))
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
