//
//  General.swift
//  AppYo
//
//  Created by QRVN on 03/01/2024.
//

import Foundation
import UIKit

class General {
    func strikeThroughText(text: String) -> String {
        let attributeString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                             value: NSUnderlineStyle.single.rawValue,
                                                 range: NSMakeRange(0, attributeString.length))
        return attributeString.string
    }
}
