//
//  To_Do_ListApp.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 1/11/22.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    
    @StateObject var listviewMdel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listviewMdel)
        }
    }
}
