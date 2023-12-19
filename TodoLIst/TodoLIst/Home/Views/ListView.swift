//
//  ListView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.items) { item  in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .frame(maxWidth: 1100)
        .navigationTitle("Todo List")
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
    .environmentObject(ListViewModel())
}



