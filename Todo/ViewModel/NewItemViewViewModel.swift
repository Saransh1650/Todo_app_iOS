//
//  NewItemViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore
class NewItemViewViewModel : ObservableObject{
    @Published var showError : Bool = false
    @Published var title : String = ""
    @Published var dueDate = Date()
    init(){
        
    }
    
    func save(){
//        check if they can save
        guard canSave else{
            return
        }
//        Get the Uid
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
//        Create model
        
//        Save Model
        let db = Firestore.firestore()
        let
        newId = UUID().uuidString
        db.collection("Users")
            .document(uid)
            .collection("todo")
            .document(newId)
            .setData(["id": newId,
                      "title": title,
                      "dueDate" : dueDate,
                      "creationDate" : Date().timeIntervalSince1970,
                      "isDone" : false])
        
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
