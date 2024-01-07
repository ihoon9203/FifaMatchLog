//
//  Utility.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import Foundation
import UIKit

extension UIColor {
    func themeColor() -> UIColor {
        return UIColor(named: "ThemeColor")!
    }
}

class InsetedTextField: UITextField {
    var textInsets = UIEdgeInsets.zero

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
}

extension String {
    func convertKoreanToHex() -> String {
        var hexString = ""
        
        for character in self {
            let scalarValue = character.unicodeScalars.first!.value
            // Check if the character is Korean
            if scalarValue >= 0xAC00 && scalarValue <= 0xD7A3 {
                // Convert each byte to hexadecimal with a '%' prefix
                for byte in character.utf8 {
                    hexString += "%" + String(format: "%02X", byte)
                }
            } else {
                hexString += String(character)
            }
        }
        
        return hexString
    }
}
