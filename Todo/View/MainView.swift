//
//  ContentView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
   
    var body: some View {

        if viewModel.currenUserid.isEmpty{
//            Signed IN
         LoginView()
        
        }
        else{
            accountView
      }
        
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListItemView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
