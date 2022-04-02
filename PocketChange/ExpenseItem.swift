//
//  ExpenseItem.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/27/22.
//

import Foundation

enum Category: String, CustomStringConvertible, CaseIterable, Codable {
    var description: String {
        get {
            return self.rawValue.capitalized
        }
    }
    
    case business
    case personal
    case household
    case charity
    case other
}

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var category: Category
    var amount: Double
}
