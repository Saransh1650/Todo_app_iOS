//
//  TodoApp.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI
import FirebaseCore
@main
struct TodoApp: App {
    
     init(){
         FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
