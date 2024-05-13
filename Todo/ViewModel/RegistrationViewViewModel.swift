//
//  RegistrationViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore
class RegistrationViewViewModel : ObservableObject {
    @Published var name : String = ""
    @Published var email = ""
    @Published var password  = ""
    
    init(){
        
    }
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self.insertUserId(id: userId)
        }
      
        
    }
    
    private func insertUserId(id :String){
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(id)
            .setData(["id" : id,
                                "name" : name,
                                "email" : email,
                                "date joined" : Date().timeIntervalSince1970
                               ])
    }
    private func validate()->Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        return true
    }
}
