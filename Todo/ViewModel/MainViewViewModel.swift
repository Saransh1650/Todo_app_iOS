//
//  MainViewViewModel.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseAuth
import Foundation
class MainViewViewModel : ObservableObject {
    @Published var currenUserid = ""
    
    
    
    init(){
        currenUserid = Auth.auth().currentUser?.uid ?? ""
    }
    
    public var isSignedin : Bool {
        return Auth.auth().currentUser != nil
    }
}
