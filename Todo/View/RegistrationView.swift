//
//  RegistrationView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    var body: some View {
        VStack{
//            Header
            HeaderView(title: "Register",x:25, caption: "Get things organized", colour: .orange, rotation: 15)
                .offset(y: -35)
//            Form
            
            Form{
                TextField("Enter Name",text: $viewModel.name)
                    .textFieldStyle(.automatic)
                    .textInputAutocapitalization(.never)
                TextField("Enter Email",text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                     .textFieldStyle(.automatic)
                SecureField("Enter Password",text: $viewModel.password)
                     .textFieldStyle(.automatic)
                     .textInputAutocapitalization(.never)
                CustomButton(name: "Register", colour: .orange){
//                    do something
                    viewModel.register()
                }
            }.offset(y:-50)
        }
    }
}

#Preview {
    RegistrationView()
}
