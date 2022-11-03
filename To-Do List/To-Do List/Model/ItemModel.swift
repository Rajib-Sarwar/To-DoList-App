//
//  ItemModel.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 2/11/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    var updateCompletion: ItemModel {
        ItemModel(id: id, title: title, isComplete: !isComplete)
    }
}
