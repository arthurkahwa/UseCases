//
//  UserDetailModel.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/12/23.
//

import Foundation

struct UserDetail: Codable, Identifiable, Hashable {
  struct Address: Codable, Hashable {
    struct Geo: Codable, Hashable {
      let lat: Double
      let lng: Double
    }

    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
  }

  struct Company: Codable, Hashable {
    let name: String
    let catchPhrase: String
    let bs: String
  }

  let id: Int
  let name: String
  let username: String
  let email: String
  let address: Address
  let phone: String
  let website: String
  let company: Company
}
