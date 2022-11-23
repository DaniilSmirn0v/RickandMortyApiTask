//
//  LocationListCell.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit
import SnapKit

class LocationListCell: UICollectionViewCell {
    // MARK: - Properties

    static let reuseId = "LocationListCell"
    
    // MARK: - Views

    lazy var locationImageView = UIImageView().setup(cornerRadius: 13).setupAutoLayout()
    
    lazy var locationNameLabel = UILabel().setup(
        font:  17,
        text: "Тут будет какое то описание контента, если он подгрузится",
        color: .black,
        backgroundColor: .black.withAlphaComponent(0.5)
    ).setupAutoLayout()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods

extension LocationListCell {

    private func setupHierarchy() {
        [locationImageView,
         locationNameLabel].forEach { addSubview($0) }
    }

    private func setupLayout() {
        locationImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        locationNameLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }
    }
}
