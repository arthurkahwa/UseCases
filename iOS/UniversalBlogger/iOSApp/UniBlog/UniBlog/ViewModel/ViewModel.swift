//
//  ViewModel.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var userList:[User] = []
    @Published var userListLoading = true
    
    func findUserList() async {
        let service = Service.shared
        
        let path = "http://localhost:8080/api/users"
        let method = HttpMethod.GET
        
        let fetchUserResult: Result<[User], AppError> = await service.DataOperation(on: path, using: method)
        switch fetchUserResult {
            case .success(let list):
                userList = list
                userListLoading = false
            case .failure(let error):
                    print("\(error)")
        }
    }
}
