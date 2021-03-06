//
//  Colors.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func fontGray() -> UIColor {
        return UIColor(hex: "4A4A4A")
    }
    
    static func backgroundBlue() -> UIColor {
        return UIColor(hex: "81B4CA")
    }
    
    static func operationsBlue() -> UIColor {
        return UIColor(hex: "3D5361")
    }
    
    static func digitsBlue() -> UIColor {
        return UIColor(hex: "B0FEFF")
    }
    
    static func extrasBlue() -> UIColor {
        return UIColor(hex: "C0F3F7")
    }
}

extension UIColor {
    
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
