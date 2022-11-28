//
//  LocationDetailCollectionCell.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit
import SnapKit

struct LocationDetailCellViewModel: ViewModel {
    let locationImageView: String
    let locationLabel: String
}

protocol LocationDetailCellConfigurable where Self: UICollectionViewCell {
    func configure(with viewModel: ViewModel)
}

class LocationDetailCell: UICollectionViewCell {
    // MARK: - Properties

    static let identifier = "LocationDetailCollectionCell"

    // MARK: - Views

    var locationImageView = UIImageView().setup(cornerRadius: 13)

    lazy var locationLabel = UILabel()
        .setup(font:  17,
               backgroundColor: .black.withAlphaComponent(0.5))
        .setupAutoLayout()

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

// MARK: - Private

extension LocationDetailCell {

    private func setupHierarchy() {
        [
            locationImageView,
            locationLabel
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        locationImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(locationLabel)
        }

        locationLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

// MARK: - LocationDetailCellConfigurable

extension LocationDetailCell: LocationDetailCellConfigurable {

    func configure(with viewModel: ViewModel) {
        guard let vm = viewModel as? LocationDetailCellViewModel else { return }
        let imageString = vm.locationImageView
        locationImageView.loadImage(with: imageString)
        locationLabel.text = vm.locationLabel
    }
}
