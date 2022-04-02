//
//  ContentView.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/27/22.
//

import SwiftUI

struct ContentView: View {
    var removeFuncs: [Category : (IndexSet) -> Void] {
        let funcs = [removeBusinessItems, removePersonalItems, removeHousholdItems, removeCharityItems, removeOtherItems]
        var funcDict = [Category : (IndexSet) -> Void]()
        for (c, f) in zip(Category.allCases, funcs) {
            funcDict[c] = f
        }
        return funcDict
    }
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases, id: \.self) { category in
                    Section(category.description) {
                        ForEach(expenses.items.filter {$0.category == category } )  { item in
                            ItemView(item: item)
                        }
                        .onDelete(perform: removeFuncs[category]!)
                    }
                }
            }
            .navigationTitle(Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "PC")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, from category: Category) {
        var generalOffsets = IndexSet()
        let categorySpecificExpenses = expenses.items.filter {$0.category == category }
        for offset in offsets {
            let item = categorySpecificExpenses[offset]
            if let index = expenses.items.firstIndex(of: item) {
                generalOffsets.insert(index)
            }
        }
        expenses.items.remove(atOffsets: generalOffsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, from: .business)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, from: .personal)
    }
        
    func removeHousholdItems(at offsets: IndexSet) {
        removeItems(at: offsets, from: .household)
    }
        
    func removeCharityItems(at offsets: IndexSet) {
        removeItems(at: offsets, from: .charity)
    }
        
    func removeOtherItems(at offsets: IndexSet) {
        removeItems(at: offsets, from: .other)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
