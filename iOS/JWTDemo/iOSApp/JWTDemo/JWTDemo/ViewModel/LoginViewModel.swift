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
    @Published var userIsAuthenticated = false
    
    func login() {
        Task {
            switch await ApiService().login(with: username, and: password) {
            case .success(let token):
                userDefaults.setValue(token, forKey: "jsonWebToken")
                userIsAuthenticated = true
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
