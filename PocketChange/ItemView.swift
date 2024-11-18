//
//  ItemView.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/30/22.
//

import SwiftUI

struct ItemView: View {
    @State var item: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.category.description)
                    .font(.subheadline)
            }
            
            Spacer()
            Text(item.amount, format: .localCurrency)
                .style(for: item.amount)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: ExpenseItem(id: UUID(), name: "Test", category: .personal, amount: 1.0))
    }
}
