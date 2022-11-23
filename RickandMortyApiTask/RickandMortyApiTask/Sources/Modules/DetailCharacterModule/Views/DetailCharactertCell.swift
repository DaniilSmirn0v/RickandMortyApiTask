//
//  DetailCharactertCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

final class DetailCharactertCell: UITableViewCell {
    // MARK: - Properties

    static let reuseID = "DetailCharactertCell"

    lazy var charactertImage = UIImageView().setup().setupAutoLayout()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(charactertImage)
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

