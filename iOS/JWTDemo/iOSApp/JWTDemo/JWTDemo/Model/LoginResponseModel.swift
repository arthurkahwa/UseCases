//
//  LoginResponseModel.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

struct LoginResponse: Codable {
    let tomen: String?
    let message: String?
    let success: Bool
}
