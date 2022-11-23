//
//  UIView+Autolayout.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit

protocol AutoLayoutPrepareable {
    func setupAutoLayout() -> Self
}

extension UIView: AutoLayoutPrepareable { }

extension AutoLayoutPrepareable where Self: UIView {

    func setupAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

extension Array where Element == UIView {

    func setupAutoLayout() {
        for element in self {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}
