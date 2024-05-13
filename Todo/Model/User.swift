//
//  User.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import Foundation

struct User : Codable, Identifiable {
    let id :String
    let name : String
    let email:String
    let joined :Double
}
