//
//  ContentView.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct TodoItemListView: View {
    @State private var message: String = ""
    
    @State private var todoItems: [TodoItem] = [
        TodoItem(message: "This is a todo list item", id: 1),
        TodoItem(message: "This is another item", id: 2)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Enter a new item", text: $message, onCommit:  {
                    self.todoItems.append(
                        TodoItem(
                            message: self.message,
                            id: (self.todoItems.last?.id ?? 0) + 1
                        )
                    )
                    
                    self.message = ""
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                
                List {
                    ForEach(todoItems) { todoItem in
                        HStack {
                            Text(todoItem.message)
                            
                            Spacer()
                            
                            Button(action: {()
                                if let item = self.todoItems.firstIndex(where: {$0.id == todoItem.id}) {
                                    self.todoItems.remove(at: item)
                                }
                            }) {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 5)
            }
            .navigationBarTitle("Todo List")
            .padding(.top, 5)
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
