//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/22/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var vm = AuthVM()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
