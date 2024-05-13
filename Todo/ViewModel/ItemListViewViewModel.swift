//
//  ItemListViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore
// View model for single item of a list
class ItemListViewViewModel : ObservableObject{
    @Published var done = false
    
    private var user = FirebaseAuth.Auth.auth().currentUser?.uid
    init(){}
    
    func setIsDone(check : Bool){
        done = check
    }
    
    func isDone(id : String){
       
        
       
        let db = Firestore.firestore()
        
        db.collection("Users").document(user ?? "").collection("todo").document(id).updateData(["isDone":done])
        
        
   }
        
    
}
