//
//  AddExpenseView.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/28/22.
//

import SwiftUI

struct AddExpenseView: View {
    static let categories = Category.allCases.map { $0.rawValue.capitalized }
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var category: Category = .business
    @State private var amount = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Category", selection: $category) {
                    ForEach(Category.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                TextField("Amount", value: $amount, format:.localCurrency)
                    .style(for: amount)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(id: UUID(), name: name, category: category, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
