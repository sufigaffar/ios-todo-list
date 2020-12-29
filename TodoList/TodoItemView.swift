//
//  TodoItemView.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct TodoItemView: View {
    var todoItem: TodoItem
    
    var body: some View {
        VStack {
            Text(todoItem.message)
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
                )
            )
            TodoItemView(
                todoItem: TodoItem(
                    message: "Another message",
                    id: 2
                )
            )
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
