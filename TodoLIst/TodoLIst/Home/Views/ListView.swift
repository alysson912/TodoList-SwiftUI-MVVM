//
//  ListView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
    ItemModel(title: "Iphone", isCompleted: true),
    ItemModel(title: "Mac", isCompleted: true),
    ItemModel(title: "Ipad", isCompleted: false),
    ]
    
    
    var body: some View {
        List {
            ForEach(items) { item  in
               ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List ( ͡° ͜ʖ ͡°)")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") { AddView() }
            }
        }
    }
}

#Preview ("This is the first title"){
    NavigationStack {
       ListView()
    }
    
}



