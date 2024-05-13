//
//  ProfileVIewViewMode.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileVIewViewModel : ObservableObject{
    init(){
        getUserData()
    }
    
    @Published var user : User? = nil
    
    
    func getUserData(){
        guard let userId = FirebaseAuth.Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId).getDocument{ (snapShot, err) in
                guard let data = snapShot?.data() else {
                      print("No documents")
                      return
                    }
            print(snapShot?.data() ?? "No data")
                    DispatchQueue.main.async {
                    self.user = User(id: data["id"] as? String ?? "", name:  data["name"] as? String ?? "", email:  data["email"] as? String ?? "", joined:  data["date joined"] as! Double )
                }
        }
    }
    
    func logOut(){
        do{
           try Auth.auth().signOut()
        }catch{
            print(error)
        }
           
        
        
    }
}
