//
//  APIService.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

/// TODO: Refactor me to Generics
actor ApiService {
    let urlSession = URLSession.shared
    
    func login(with username: String, and password: String) async -> Result<String, AppError> {
        let loginUri = "http://localhost:3000/api/login"
        
        guard let url = URL(string: loginUri)
        else {
            return .failure(.badUrl)
        }
        
        let requestBody = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let body = try JSONEncoder().encode(requestBody)
            request.httpBody = body
            let (data, response) = try await urlSession.data(for: request)
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                if !loginResponse.success {
                    return .failure(.loginError(message: "Invalid login attempt"))
                }
                
                guard let token = loginResponse.token
                else {
                    return .failure(.missingToken)
                }
                
                return .success(token)
            }
            else {
                return .failure(.badResponse)
            }
        }
        catch {
            return .failure(.exception(description: String(describing: error)))
        }
    }
    
    func findUserAccounts(using token: String) async -> Result<[UserDetail], AppError> {
        let uri = "http://localhost:3000/api/accounts"
        guard let url = URL(string: uri)
        else {
            return .failure(.badUrl)
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await urlSession.data(for: request)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200
            else {
                return .failure(.badResponse)
            }
            
            let accounts = try JSONDecoder().decode([UserDetail].self, from: data)
            if accounts.isEmpty {
                return .failure(.generalError(description: "No user details found"))
            }
            
            return .success(accounts)
        }
        catch {
            return .failure(.exception(description: String(describing: error)))
        }
    }
}
