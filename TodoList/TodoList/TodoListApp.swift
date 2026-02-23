//
//  TodoListApp.swift
//  TodoList
//
//  Created by Prem kamble on 21/02/26.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - manages single data point
 View - manages the UI
 ViewModel - manages data (models) for views
 */


@main
struct TodoListApp: App {
    
     @StateObject var listViewModle: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ListView()
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModle)
   
        }
    }
}
