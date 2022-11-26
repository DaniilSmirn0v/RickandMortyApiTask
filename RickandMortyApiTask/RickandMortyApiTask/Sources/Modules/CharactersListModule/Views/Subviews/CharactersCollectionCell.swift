//
//  CharactersCollectionCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

protocol CharactersCellViewModel {}

struct CharactersListCellViewModel: CharactersCellViewModel {
    let characterNameLabel: String
}

protocol CharactersCellConfigurable where Self: UICollectionViewCell {
    func configure(with viewModel: CharactersCellViewModel)
}

class CharactersCollectionCell: UICollectionViewCell {
    // MARK: - Properties

    static let identifier = "CharactersCollectionCell"

    // MARK: - Views

    var characterImageView = UIImageView()
        .setup(cornerRadius: 13)
        .setupAutoLayout()

    var characterNameLabel = UILabel().setup(
        textAlignment: .center,
        font: 17,
        fontWeight: .medium,
        color: .white,
        backgroundColor: .black.withAlphaComponent(0.6)
    ).setupAutoLayout()

    // MARK: - Initialize

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

// MARK: - CellConfigurable
extension CharactersCollectionCell: CharactersCellConfigurable {

    func configure(with viewModel: CharactersCellViewModel) {

        guard let vm = viewModel as? CharactersListCellViewModel else { return }
        self.characterNameLabel.text = vm.characterNameLabel
    }
}
