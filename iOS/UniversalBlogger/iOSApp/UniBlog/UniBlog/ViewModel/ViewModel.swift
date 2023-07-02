//
//  ViewModel.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var userList:[UserPost] = []
    @Published var userListLoading = true
    
    let service = Service.shared
    
    func findUserList() async {
        let path = "http://localhost:8080/api/users/posts"
        let method = HttpMethod.GET
        
        let fetchUserResult: Result<[UserPost], AppError> = await service.DataOperation(on: path, using: method)
        switch fetchUserResult {
            case .success(let list):
                userList = list
                userListLoading = false
                
            case .failure(let error):
                    print("\(error)")
        }
    }
}
