//
//  TodoListItemViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
import FirebaseAuth
class TodoListItemViewViewModel : ObservableObject{
    @Published var currentuser:String = Auth.auth().currentUser?.uid ?? ""
    @Published var todo : [TodoListItem] = []
    @Published var sheet : Bool = false
    @Published var data = []
    @Published var items = [TodoListItem]()
    private var db = Firestore.firestore()

    
    init(){
        
        getData()
        print(items)
    }
    
    
    func delete(id:String){
        db.collection("Users").document(currentuser).collection("todo").document(id).delete()
    }
   
    
    func getData() {
        
        db.collection("Users").document(currentuser).collection("todo")
            .getDocuments{ (querySnapshot, err) in
                guard let documents = querySnapshot?.documents else {
                      print("No documents")
                      return
                    }
                self.items = documents.compactMap { queryDocumentSnapshot -> TodoListItem in
                    return try! queryDocumentSnapshot.data(as: TodoListItem.self)
            }
        }
      
    
    }
    
    
}
