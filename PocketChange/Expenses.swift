//
//  Expenses.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/27/22.
//

import Foundation

@Observable
class Expenses {
    static let itemsKey = "items"
    
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: Expenses.itemsKey)
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: Expenses.itemsKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
