//
//  ListViewModel.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 19/12/23.

//MARK: CRUD FUNCTIONS

import UIKit

class ListViewModel: ObservableObject {
    // Obs: Não podemos usar  @State em classe regular
    
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems =
        [
            ItemModel(title: "Iphone", isCompleted: true),
            ItemModel(title: "Mac", isCompleted: true),
            ItemModel(title: "Ipad", isCompleted: false)
        ]
        items.append(contentsOf: newItems) // add n items
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}

