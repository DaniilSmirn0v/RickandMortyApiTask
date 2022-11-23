//
//  CharactersCollectionCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

class CharactersCollectionCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "CharactersCollectionCell"

    //MARK: - Views
    var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 13
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemOrange
        return imageView
    }()

    var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(0.6)
        label.text = "Привет как дела что нового илии не нового новейшего"
        return label
    }()

    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private methods
extension CharactersCollectionCell {
    private func setupHierarchy() {
        [
            characterImageView,
            characterNameLabel
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        characterImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(characterNameLabel)
        }

        characterNameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

