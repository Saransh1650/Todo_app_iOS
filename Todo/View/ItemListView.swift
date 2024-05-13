//
//  ItemListView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var viewModel = ItemListViewViewModel()
    @StateObject var TodoListViewModel = TodoListItemViewViewModel()
    
    var item: TodoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                HStack(){
                    Text(item.dueDate, style: .date)
                    Text("/")
                    Text(item.dueDate, style: .time)
                        
                }
                .font(.footnote)
                .foregroundColor(.gray)
            }
            Spacer()
            
            Button{
                viewModel.setIsDone(check: !viewModel.done)
                viewModel.isDone(id:item.id ?? "")
               
            }
            
            label: {
                Image(systemName: viewModel.done ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ItemListView(item: .init(creationDate: Date().timeIntervalSince1970, dueDate: Date.now, id: "123", isDone: true, title: "get eggs"))
}
