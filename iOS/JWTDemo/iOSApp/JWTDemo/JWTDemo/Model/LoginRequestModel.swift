//
//  LoginRequestModel.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}
