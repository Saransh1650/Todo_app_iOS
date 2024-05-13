//
//  ProfileView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct ProfileView: View {
    
    
    @StateObject var viewModel = ProfileVIewViewModel()
    @State var pressed = false
    
    var body: some View {
        NavigationView{
            VStack{
               
                if viewModel.user != nil {  profile(user: viewModel.user!)
                }
                else{
                    ProgressView()
                    CustomButton(name: "Logout", colour: .red) {
                        viewModel.logOut()
                    }.frame(width: 400, height: 80)
                }
            
                
            }
            .padding(.leading)
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.getUserData()
            
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        
        VStack{
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 150, height: 150)
                .padding()
            VStack(alignment: .leading,content: {
                HStack(alignment: .center,content: {
                    Text("Name :")
                        .bold()
                    Text(user.name)
                })
                HStack(content: {
                    Text("Joined :")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined))")
                })
                HStack(content:{
                    Text("e-mail :")
                        .bold()
                    Text(user.email)
                })
                
            
                    CustomButton(name: "Logout", colour: .red) {
                        pressed.toggle()
                      
                        //                        Do something
                    }
                    .alert(isPresented:$pressed) {
                                Alert(
                                    title: Text("Are you sure you want to Logout?"),
                                    message: Text("You will be redirected to the login screen"),
                                    primaryButton: .destructive(Text("Logout")) {
                                        viewModel.logOut()
                                        
                                    } ,
                                    secondaryButton: .cancel()
                                )
                            }
                    .frame(width: 400, height: 80)

            })
        }.padding(.all)
    }
        
        
    
}



#Preview {
    ProfileView()
}
