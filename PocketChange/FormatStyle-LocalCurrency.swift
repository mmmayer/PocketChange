//
//  FormatStyle-LocalCurrency.swift
//  PocketChange
//
//  Created by Michael M. Mayer on 3/31/22.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
