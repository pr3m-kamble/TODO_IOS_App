//
//  ListViewModel.swift
//  TodoList
//
//  Created by Prem kamble on 21/02/26.
//

import SwiftUI
import Combine
import Foundation
/*
 CURD Fictions
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
  
    
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemskey: String = "items_list"
    
    init(){
        getItem()
    }
    func getItem(){
//        let newItem = [
//            ItemModel(title: "this is the first title", isCompleted: false),
//            ItemModel(title: "this is secomf title", isCompleted: true),
//            ItemModel(title: "this is the third title", isCompleted: false)
//        ]
//        items.append(contentsOf: newItem)
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
      
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
      
}
