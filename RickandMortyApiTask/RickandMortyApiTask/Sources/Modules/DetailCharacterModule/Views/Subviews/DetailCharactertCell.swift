//
//  DetailCharactertCell.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import SnapKit
import Kingfisher

struct DetailCharactertCellViewModel: ViewModel {
    let charactertImage: String
}

protocol DetailCharactertCellConfigurable where Self: UITableViewCell {
    func configure(with viewModel: ViewModel)
}

final class DetailCharactertCell: UITableViewCell {
    // MARK: - Properties

    static let reuseID = "DetailCharactertCell"
    lazy var charactertImage = UIImageView().setup().setupAutoLayout()

    // MARK: - Initialization

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(charactertImage)
        bringSubviewToFront(charactertImage)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func setupLayout() {
        charactertImage.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
}

// MARK: - DetailCharactertCellConfigurable

extension DetailCharactertCell: DetailCharactertCellConfigurable {
    
    func configure(with viewModel: ViewModel) {
        guard let vm = viewModel as? DetailCharactertCellViewModel else {
            return }
        let imageString = vm.charactertImage
        charactertImage.loadImage(with: imageString)
    }
    
}




