//
//  APIService.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

actor ApiService {
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
            request.httpBody = try JSONEncoder().encode(requestBody)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                if !loginResponse.success {
                    return .failure(.loginError(message: "Invalid login attempt"))
                }
                
                guard let token = loginResponse.tomen
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
            return .failure(.encodingError(error: String(describing: error)))
        }
    }
}
