//
//  EpisodeDetailCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

class EpisodeDetailCell: UICollectionViewCell {
    //MARK: - Properties
    static let reuseId = "EpisodeDetailCell"
    //MARK: - Views
    lazy var characterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 13
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemOrange
        return imageView
    }()

    lazy var characterNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
//        descriptionLabel.textColor = .systemOrange
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Тут будет какое то описание контента, если он подгрузится"
        label.backgroundColor = .black.withAlphaComponent(0.5)
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
extension EpisodeDetailCell {

    private func setupHierarchy() {
        [
            characterImageView,
            characterNameLabel
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        characterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(characterNameLabel.snp.top)
        }

        characterNameLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(characterImageView.snp.bottom)
        }
    }

}
