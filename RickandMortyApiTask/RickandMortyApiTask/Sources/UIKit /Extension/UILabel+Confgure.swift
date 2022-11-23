//
//  UILabel+Confgure.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

extension UILabel {

    func setup(textAlignment: NSTextAlignment = .center,
               numberLines: Int = .zero,
               font: UIFont,
               text: String = "") -> UILabel {
        self.textAlignment = textAlignment
        self.numberOfLines = numberLines
        self.textColor = UIColor.white
        self.font = font
        self.text = text
        self.sizeToFit()
        return self
    }
}

