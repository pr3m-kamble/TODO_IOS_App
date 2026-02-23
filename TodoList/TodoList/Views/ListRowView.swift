//
//  ListRowView.swift
//  TodoList
//
//  Created by Prem kamble on 21/02/26.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .secondary)
            Text(item.title)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview("This is the first title") {
    Group{
        ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
        ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
    }
}

  

