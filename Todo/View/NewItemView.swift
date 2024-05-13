//
//  NewItemView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @StateObject var todoModel = TodoListItemViewViewModel()
    @Binding var sheetShower : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 70)
            
            Form{
//                title
                
                TextField("Enter title", text: $viewModel.title)
                    .textFieldStyle(.automatic)
                
//                date picker
                
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .padding()
                    .datePickerStyle(.graphical)
                
//                Custom Button
                
                CustomButton(name: "Save", colour: .blue) {
                    if viewModel.canSave{
                        viewModel.save()
                        sheetShower = false
                        
                        
                    }
                    else{
                        viewModel.showError = true
                    }
                }
                    
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text("Error !"), message: Text("Please fill all the details correctly and makce sure to add due date correctly"))
            })
        }
        
        
    }
}

#Preview {
    NewItemView(sheetShower: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
