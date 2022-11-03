//
//  ListRowView.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 1/11/22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item", isComplete: false)
    
    static var previews: some View {
        ListRowView(item: item1)
    }
}
