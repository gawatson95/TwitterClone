//
//  ExploreVM.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/28/22.
//

import Foundation

class ExploreVM: ObservableObject {
    @Published var users = [User]()
    @Published var searchText: String = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedUsers = searchText.lowercased()
            
            return users.filter {
                $0.username.contains(lowercasedUsers) || $0.fullname.lowercased().contains(lowercasedUsers)
            }
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
