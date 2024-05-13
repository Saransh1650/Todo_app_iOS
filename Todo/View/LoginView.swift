//
//  LoginView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    @State var isSignin : Bool = false
    var body: some View {
        //      Header
        NavigationView{
            VStack {
                HeaderView(title: "Todo App",x:-20, caption: "Get things done", colour: .blue, rotation: -15)
                //        Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Addres", text: $viewModel.email)
                        .textFieldStyle(.automatic)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.automatic)
                        .textInputAutocapitalization(.never)
                    
                   
                    CustomButton(name: "Login", colour: .blue) {
                        viewModel.login()
                    }
                    NavigationLink(destination: MainView().accountView.navigationBarBackButtonHidden(true)) {
                        Text("Enter the app ->")
                    }.disabled(!viewModel.getScreen())

                    

                    
                  
                }
                
                
                //        Register
                VStack{
                    
                    Text("New around here ? Register")
                        .bold()
                    NavigationLink("Create new ", destination: RegistrationView())
                    
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
