//
//  TodoItemView.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct TodoItemView: View {
    private var todoItem: TodoItem
    private var clickAction: () -> Void
    
    init(todoItem: TodoItem, clickAction: @escaping () -> Void) {
        self.todoItem = todoItem
        self.clickAction = clickAction
    }
    
    var body: some View {
        HStack {
            Text(todoItem.message)
            
            Spacer()
            
            Button(action: clickAction) {
                Text("Delete")
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItemView(
                todoItem: TodoItem(
                    message: "Test message",
                    id: 1
                ),
                clickAction: {}
            )
            TodoItemView(
                todoItem: TodoItem(
                    message: "Another message",
                    id: 2
                ),
                clickAction: {}
            )
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
