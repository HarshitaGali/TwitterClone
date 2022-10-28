//
//  SideMenuViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import Foundation

enum SideMenuViewModel : Int , CaseIterable {
    case profile
    case lists
    case bookmark
    case logout
    
    var description : String {
        switch self {
        case .profile : return "Profile"
        case .lists : return "Lists"
        case .bookmark : return "Bookmark"
        case .logout : return "Logout"
        }
    }
    
    var image : String {
        switch self {
        case .profile : return "person"
        case .lists : return "list.bullet"
        case .bookmark : return "bookmark"
        case .logout : return "arrow.left.square"
        }
    }
    
}
