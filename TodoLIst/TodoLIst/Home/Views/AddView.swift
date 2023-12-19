//
//  AddView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss // atual
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            ScrollView {
                VStack {
                    TextField("Type something here", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    
                    
                    Button(action: {
                        saveButtonPressed()
                    }, label: {
                        Text("Save" . uppercased())
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                }
                .padding(14)
                .frame(maxWidth: 400)
            }
           
            .navigationTitle("Add an Item")
            .alert(alertTitle, isPresented: $showAlert) {
                getAlert(text: "voltar" )
            }
        }
    }
    
    func saveButtonPressed(){
        
        if textIsApropriate() {
            viewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsApropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert(text: String) -> AnyView {
        showAlert.toggle()
        return AnyView(Text(text))
    }
}

#Preview {
        NavigationStack {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
      
}

