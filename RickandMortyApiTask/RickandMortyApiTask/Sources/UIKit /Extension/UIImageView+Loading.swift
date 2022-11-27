//
//  UIImageView+Loading.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 27.11.22.
//

import UIKit
import Kingfisher


extension UIImageView {

    func loadImage(with url: String?) -> Void {
        kf.indicatorType = .activity
        image = nil
        if let imageURL = url, let url = URL(string: imageURL) {
            self.kf.setImage(with: url)
        }
    }
    
}
