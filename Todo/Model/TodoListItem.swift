//
//  TodoListItem.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseFirestoreSwift
import Foundation
import Firebase

struct TodoListItem: Codable, Identifiable{
    
    var creationDate: TimeInterval
    var dueDate : Date
    var id : String?
    var isDone : Bool
    var title : String
    
    

    mutating func setDone(_ state : Bool){
        isDone = state
    }
}
