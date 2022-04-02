//
//  View-ExpenseStyling.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/31/22.
//

import SwiftUI

extension View {
    func style(for amount: Double) -> some View {
        if amount < 10 {
            return self.foregroundColor(.blue)
        } else if amount < 100 {
            return self.foregroundColor(.green)
        } else {
            return self.foregroundColor(.red)
        }
    }
}
