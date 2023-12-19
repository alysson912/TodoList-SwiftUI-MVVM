//
//  ListViewModel.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 19/12/23.

//MARK: CRUD FUNCTIONS

import UIKit

class ListViewModel: ObservableObject {
    // Obs: Não podemos usar  @State em classe regular
    
    
    @Published var items: [ItemModel] = [] { // sempre que alterar o array a função a seguir será chamada
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    
    func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
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
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

