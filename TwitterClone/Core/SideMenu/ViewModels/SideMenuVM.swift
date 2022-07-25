//
//  SideMenuVM.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import Foundation

enum SideMenuVM: Int, CaseIterable {
    case profile, lists, bookmarks, logout
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
