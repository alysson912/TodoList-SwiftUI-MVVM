//
//  TodoLIstApp.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI


@main
struct TodoLIstApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack { // todas as views do app terão uma NavigationView
                ListView()
            }
            
        }
    }
}
