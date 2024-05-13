//
//  TodoListItemView.swift
//  Todo
//
//  Created by Saransh Singhal on 05/05/24.
//
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    ItemListView(item: item)
                        .swipeActions(){
                            Button("Delete"){
                                viewModel.delete(id: item.id ?? "abc")
                                viewModel.getData()
                            }
                            .tint(.red)
                        }
                }
                .onAppear {
                    viewModel.getData()
                    print("items = ", viewModel.items)
                }
                .listStyle(.automatic)
            }
            .navigationTitle("Todo List")
            .sheet(isPresented: $viewModel.sheet, onDismiss: {
                viewModel.getData()
            }) {
                NewItemView(sheetShower: $viewModel.sheet)
            
            }
            .toolbar {
                Button(action: {
                    
                    viewModel.sheet = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
    

#Preview {
    TodoListItemView()
}
