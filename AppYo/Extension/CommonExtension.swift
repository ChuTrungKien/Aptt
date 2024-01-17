//
//  CommonExtension.swift
//  AppYo
//
//  Created by QRVN on 04/01/2024.
//

import Foundation
import UIKit

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

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

extension UITableView {
    func registerCells(cells: [String], bundle: Bundle? = nil) {
        for cell in cells {
            let cellNib = UINib(nibName: cell, bundle: bundle)
            self.register(cellNib, forCellReuseIdentifier: cell)
        }
    }
}

extension UIViewController {
    func pushVC(vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
}

extension UIButton {
    func setBorder() {
        //self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        //add shadow effect:
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
    }
}

extension Array {
    //Lấy item tại index đã check nil
    func itemAtIndex(index: Int) -> Element? {
        if self.count > index, index >= 0 {
            return self[index]
        } else {
            return nil
        }
    }
}
