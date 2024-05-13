//
//  CustomButton.swift
//  Todo
//
//  Created by Saransh Singhal on 06/05/24.
//

import SwiftUI

struct CustomButton: View {
    var name:String
    var colour :Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        }
        
    label:{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(colour)
            Text(name)
                .foregroundColor(.white)
                .bold()
                .font(.title3)
        }
        
    }.padding()
    }
}

#Preview {
    CustomButton(name: "Login", colour: .orange) {
//        Do something
    }
}
