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
    
    /// Gets the formatted date for the current TodoItem as a string.
    private func getFormattedDateString() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: todoItem.date)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todoItem.message)
                
                Text(getFormattedDateString())
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                    .padding(.top, 1)
                    .font(.system(size: 14))
            }
            
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
                    date: Date(),
                    id: 1
                ),
                clickAction: {}
            )
            TodoItemView(
                todoItem: TodoItem(
                    message: "Another message",
                    date: Date(),
                    id: 2
                ),
                clickAction: {}
            )
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
