//
//  ListView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["Orange", "Banana", "Tomato"]
    
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item  in
                ListRowView(title: item)
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

#Preview {
    NavigationStack {
        ListView()
    }
    
}



