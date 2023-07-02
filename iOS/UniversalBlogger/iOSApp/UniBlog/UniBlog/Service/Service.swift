//
//  Service.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import Foundation

class Service {
    static let shared = Service()
    
    private init() {}
    
    func Download(from path: String) async -> Result<Data, AppError> {
        
        guard let url = URL(string: path)
        else {
            return .failure(.networkError("Bad url: \(path)"))
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        do {
            let (data, httpResponse) = try await session.data(for: request)
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                
                if statusCode >= 200 && statusCode < 300 {
                    return .success(data)
                }
            }
            else {
                return .failure(.networkError("Bad network response: \(httpResponse)"))
            }
        }
        catch {
            return .failure(.networkError(String(describing: error)))
        }
        
        return .failure(.generalError("Unspecified Error"))
    }
    
    func DataOperation<Element: Codable>(on path: String,
                                           using method: HttpMethod,
                                           with requestBody: Element? = nil) async -> Result<Element, AppError> {
        
        guard let url = URL(string: path)
        else {
            return .failure(.networkError("Bad url: \(path)"))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let requestBody = requestBody {
            do {
                request.httpBody = try JSONEncoder().encode(requestBody)
            }
            catch {
                return .failure(.networkError("Request body is invalid"))
            }
        }
        
        let session = URLSession.shared
        do {
            let (data, httpResponse) = try await session.data(for: request)
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                
                if statusCode >= 200 && statusCode < 300 {
                    let result = try JSONDecoder().decode(Element.self, from: data)
                    return .success(result)
                }
            }
            else {
                return .failure(.networkError("Bad network response: \(httpResponse)"))
            }
        }
        catch {
            return .failure(.networkError(String(describing: error)))
        }
        
        return .failure(.generalError("Unspecified Error"))
    }
}
