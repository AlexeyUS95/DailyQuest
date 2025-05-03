//
//  Font+Extension.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 01.05.2025.
//

import class UIKit.UIFont
import struct SwiftUI.Font

extension UIFont {

    static let header = UIFont.systemFont(ofSize: 34, weight: .regular)
    static let subtitle = UIFont.systemFont(ofSize: 14, weight: .regular)

    func font() -> Font {
        Font(self)
    }
}
