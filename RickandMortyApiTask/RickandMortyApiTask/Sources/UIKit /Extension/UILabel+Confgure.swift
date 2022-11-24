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
               font: CGFloat,
               fontWeight: UIFont.Weight = .regular,
               text: String = "",
               color: UIColor = .white,
               backgroundColor: UIColor = .clear) -> UILabel {
        self.textAlignment = textAlignment
        self.numberOfLines = numberLines
        self.textColor = color
        self.backgroundColor =  backgroundColor
        self.font = .systemFont(ofSize: font, weight: fontWeight)
        self.text = text
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
        return self
    }
}


