//
//  ContentView.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct TodoItemListView: View {
    @State private var todoItems: [TodoItem] = []
    @State private var newItemClicked = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if (todoItems.count != 0) {
                    List {
                        ForEach(todoItems) { todoItem in
                            TodoItemView(todoItem: todoItem) {
                                if let item = self.todoItems.firstIndex(where: {$0.id == todoItem.id}) {
                                    self.todoItems.remove(at: item)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 5)
                } else {
                    Text("No todo list items found.")
                }
                
                NavigationLink(destination: NewTodoListItem() { (message: String) in
                    self.todoItems.append(
                        TodoItem(
                            message: message,
                            date: Date(),
                            id: (self.todoItems.last?.id ?? 0) + 1
                        )
                    )
                }, isActive: $newItemClicked) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Todo List")
            .padding(.top, 5)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {()
                        self.newItemClicked = true;
                    }) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .padding(6)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
