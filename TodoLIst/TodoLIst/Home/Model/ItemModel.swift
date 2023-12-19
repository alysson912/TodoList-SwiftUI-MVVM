//
//  TodoModel.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//MARK: para acessar o ID dos intens com Foreach devemos utilizar o Identifiable

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString // func onde o item receberá um ID aleatorio 
    let title: String?
    let isCompleted: Bool
}
