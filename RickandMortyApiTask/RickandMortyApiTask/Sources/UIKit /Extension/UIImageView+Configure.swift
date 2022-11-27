//
//  UIImageView+Configure.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

extension UIImageView {

    func setup(cornerRadius: CGFloat = 12) -> UIImageView {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = .systemOrange
        return self
    }
}

