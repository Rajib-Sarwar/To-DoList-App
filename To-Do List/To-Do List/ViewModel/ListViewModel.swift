//
//  ListViewModel.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 2/11/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
        ItemModel(title: "This is first title!", isComplete: false),
        ItemModel(title: "This is second title!", isComplete: true),
        ItemModel(title: "This is third title!", isComplete: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from indexSet: IndexSet, to index: Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplete: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex( where: { $0.id == item.id }) {
            items[index] = item.updateCompletion
        }
    }
}
