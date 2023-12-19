//
//  TodoLIstApp.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI


@main
struct TodoLIstApp: App {
    
  @StateObject  var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack { // todas as views do app terão uma NavigationView
                ListView()
            }
         //   .navigationViewStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Navigation View Style@*/DefaultNavigationViewStyle()/*@END_MENU_TOKEN@*/) will be deprecated
           
            .environmentObject(listViewModel)
        }
    }
}
