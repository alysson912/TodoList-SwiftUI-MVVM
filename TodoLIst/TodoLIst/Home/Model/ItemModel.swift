//
//  TodoModel.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//MARK: para acessar o ID dos intens com Foreach devemos utilizar o Identifiable

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String //= UUID().uuidString // func onde o item receberá um ID aleatorio
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

