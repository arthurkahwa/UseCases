//
//  AppError.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

enum AppError: Error {
    case badResponse
    case badUrl
    case dataRetrievalError
    case encodingError(error: String)
    case exception(description: String)
    case generalError(description: String)
    case loginError(message: String)
    case invalidCredentials
    case missingToken
    case networkError
}
