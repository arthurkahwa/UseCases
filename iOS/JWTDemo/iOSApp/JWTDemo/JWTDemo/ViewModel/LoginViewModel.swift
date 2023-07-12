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
    
    func login() {
        Task {
            switch await ApiService().login(with: username, and: password) {
            case .success(let token):
                print(token)
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
