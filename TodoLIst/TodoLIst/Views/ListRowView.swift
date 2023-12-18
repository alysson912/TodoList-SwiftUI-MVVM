//
//  ListRowView.swift
//  TodoLIst
//
//  Created by Alysson Menezes on 18/12/23.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This is the first title")
}
