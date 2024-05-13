//
//  HeaderView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let x: Double
    let caption:String
    let colour:Color
    let rotation : Double
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(colour)
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .bold()
                    Text(caption)
                        .font(.system(size: 30))
                }
                .padding(.top, 30)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotation))
                
                
            }
            .offset(x: x,y: -100)
            .rotationEffect(Angle(degrees: -rotation))
            .frame(width: UIScreen.main.bounds.width * 3, height: 100*3.5)
            Spacer()
        }
    }
}

#Preview {
    HeaderView(title: "Title",x:20, caption: "Caption", colour: .pink, rotation: 15)
}
