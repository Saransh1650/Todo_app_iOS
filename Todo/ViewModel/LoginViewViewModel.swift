//
//  LoginViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var errorMessage = ""
    @Published var currentUser : String? = ""
   
    init() {
       
    }
    
   
    
    
    func login() {
        guard validate() else{
            return
        }
//        Try to login the user
        Auth.auth().signIn(withEmail: email, password: password)
        currentUser = Auth.auth().currentUser?.uid ?? ""
       
    }
    
    func getScreen() -> Bool{
        guard currentUser != "" else{
            return false
        }
        return true
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.isEmpty else{
            errorMessage = "Please fill all the fields"
            return false
        }
        guard email.contains("@"), email.contains(".")else{
            errorMessage = "invalid email address"
            return false
        }
        return true
    }
    
}
