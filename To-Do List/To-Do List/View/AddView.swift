//
//  AddView.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 1/11/22.
//

import SwiftUI

struct AddView: View {
    
    @State var textfFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textfFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
