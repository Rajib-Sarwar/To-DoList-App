//
//  ListViewModel.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 2/11/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: Keys.itemList.rawValue),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
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
    
    func saveItems() {
        guard let encodedData = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(encodedData, forKey: Keys.itemList.rawValue)
    }
}

enum Keys: String {
    case itemList
}

extension Keys {
    var value: String {
        switch self {
        case .itemList:
            return "items_list"
        }
    }
}
