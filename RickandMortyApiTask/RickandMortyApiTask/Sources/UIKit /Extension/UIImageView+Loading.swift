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
            self.kf.setImage(with: url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let value):
                    self.image = value.image
                case .failure(_):
                    self.image = UIImage(named: "notFoundBlack")
                }
            }
        }
    }
    
}

