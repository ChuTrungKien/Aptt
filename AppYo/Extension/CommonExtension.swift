//
//  CommonExtension.swift
//  AppYo
//
//  Created by QRVN on 04/01/2024.
//

import Foundation

extension Int {
    func formatNumberInt(maxFraction: Int = 2) -> String {
        let currencyStyle = NumberFormatter()
        currencyStyle.numberStyle = .decimal
        currencyStyle.maximumFractionDigits = maxFraction
        currencyStyle.roundingMode = .halfUp
        
        let locale = Locale.current
        currencyStyle.locale = locale
        currencyStyle.groupingSeparator = locale.groupingSeparator ?? "."
        currencyStyle.groupingSize = 3
        currencyStyle.alwaysShowsDecimalSeparator = false
        currencyStyle.usesGroupingSeparator = true
        currencyStyle.isLenient = true
        let formatedString = currencyStyle.string(from: NSNumber(value: self)) ?? ""
        return formatedString
    }
}
