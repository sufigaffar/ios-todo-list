//
//  NewTodoListItem.swift
//  TodoList
//
//  Created by Sufi Gaffar on 29/12/2020.
//

import SwiftUI

struct NewTodoListItem: View {
    @State private var message: String = ""
    
    var createAction: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter a new item", text: $message, onCommit: {
                self.createAction(self.message)
                self.message = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            
            Button(action: {()
                self.createAction(self.message)
                self.message = ""
            }) {
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
