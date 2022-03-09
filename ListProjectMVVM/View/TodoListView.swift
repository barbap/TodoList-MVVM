//
//  ContentView.swift
//  ListProjectMVVM
//
//  Created by Bárbara Araújo Paim  on 08/03/22.
//

import SwiftUI



struct TodoListView: View {
    
    @ObservedObject var todoManager: TodoListManager
    
    var body: some View {
        NavigationView {
            ZStack{
            List {
                ForEach(todoManager.items) { item in
                    NavigationLink(
                        destination: Text("Destination \(item.name)"),
                    label: {
                        Text(item.name)
                    })
                    
                    
                    
                }
                .onDelete(perform: { indexSet in
                    todoManager.delete(at: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    todoManager.move(indices: indices, newOffset: newOffset)
                })
            }
                if todoManager.items.count == 0 {
                    Text("Please, start by adding items")
                        .foregroundColor(.gray)
                
            }
                
            }.navigationTitle("Todo's")
                .toolbar(content: {
                    ToolbarItemGroup (placement: .navigationBarTrailing) {
                        EditButton()
                        
                        Button( action: {
                            todoManager.addItem()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoListView(todoManager: TodoListManager.emptyState())
                .previewDisplayName("empty state")
            TodoListView(todoManager: TodoListManager.fullState())
                .previewDisplayName("data exists")
        }
        
    }
}
