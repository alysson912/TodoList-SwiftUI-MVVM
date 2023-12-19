//
//  AddView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            ScrollView {
                VStack {
                    TextField("Type something here", text: $textFieldText)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .light ? .white : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Save" . uppercased())
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .padding(.horizontal)
                }
                .padding(14)
            }
            .navigationTitle("Add an Item")
        }
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    
}
