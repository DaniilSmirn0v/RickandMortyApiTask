//
//  EpisodeDetailCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

struct EpisodeDetailCellViewModel: ViewModel {
    let characterImageView: String
    let characterNameLabel: String
}

protocol EpisodeCellConfigurable where Self: UICollectionViewCell {
    func configure(with viewModel: ViewModel)
}

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
        return imageView
    }()

    lazy var characterNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        characterNameLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }
    }
}

extension EpisodeDetailCell: EpisodeCellConfigurable {
    func configure(with viewModel: ViewModel) {
        guard let vm = viewModel as? EpisodeDetailCellViewModel  else { return }
        let imageString = vm.characterImageView
        characterImageView.loadImage(with: imageString)
        characterNameLabel.text = vm.characterNameLabel
    }
}
