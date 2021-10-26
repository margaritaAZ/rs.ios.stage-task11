//
//  Helpers.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import Foundation
import UIKit

extension UIColor {
    static let smokyBlack: UIColor = #colorLiteral(red: 0.07843137255, green: 0.07843137255, blue: 0.07450980392, alpha: 1)
    static let spaceWhite: UIColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    static let champagne: UIColor = #colorLiteral(red: 0.9568627451, green: 0.9137254902, blue: 0.8039215686, alpha: 1)
    static let glaucous: UIColor = #colorLiteral(red: 0.4352941176, green: 0.5411764706, blue: 0.7176470588, alpha: 1)
    static let queenBlue: UIColor = #colorLiteral(red: 0.2980392157, green: 0.3764705882, blue: 0.5215686275, alpha: 1)
    static let coral: UIColor = #colorLiteral(red: 1, green: 0.5215686275, blue: 0.3215686275, alpha: 1)
    static let cyanProcess: UIColor = #colorLiteral(red: 0, green: 0.6470588235, blue: 0.8784313725, alpha: 1)
    static let slateGray: UIColor = #colorLiteral(red: 0.4196078431, green: 0.4431372549, blue: 0.4941176471, alpha: 1)
}

extension UIFont {
    enum FontStyle: String {
        case bold
        case medium
    }
    
    static func roboto(_ size: CGFloat, _ type: FontStyle) -> UIFont {
        UIFont(name: "Roboto-\(type.rawValue.capitalized)", size: size) ?? .systemFont(ofSize: size)
    }
}
