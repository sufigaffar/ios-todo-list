//
//  NewTodoListItem.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct NewTodoListItem: View {
    @State private var message = ""
    @State private var date = Date()
    
    var createAction: (_ message: String, _ date: Date) -> Void
    
    /// Creates a new item with user entered data.
    private func createNewItem() -> Void {
        createAction(message, date)
        message = ""
    }
    
    var body: some View {
        VStack {
            TextField("Message", text: $message, onCommit: createNewItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top, 20)
            DatePicker(
                "Date",
                selection: $date,
                displayedComponents: [.date, .hourAndMinute]
            )
            .padding(.top, 10)
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle("New todo item", displayMode: .inline)
        .toolbar {
            if (message != "") {
                Button(action: createNewItem) {
                    Text("Done")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct NewTodoListItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTodoListItem(
                createAction: {(message: String, date: Date) in}
            )
        }
    }
}
