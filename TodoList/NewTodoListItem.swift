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
    
    var createAction: (String) -> Void
    
    private func createNewItem() -> Void {
        self.createAction(self.message)
        self.message = ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter a new item", text: $message, onCommit: createNewItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: createNewItem) {
                Text("Create item")
            }
            .padding(5)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            
            Spacer()
        }
        .navigationBarTitle("New todo item")
    }
}
