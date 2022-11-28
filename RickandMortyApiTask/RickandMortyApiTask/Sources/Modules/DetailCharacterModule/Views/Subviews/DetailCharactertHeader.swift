//
//  DetailCharactertHeader.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import SnapKit

final class DetailCharactertHeader: UITableViewHeaderFooterView {
    // MARK: - Properties

    static let reuseId = "DetailCharactertHeader"

    lazy var title = UILabel().setup(
        textAlignment: .left,
        font: 20,
        fontWeight: .regular,
        color: .orange
    ).setupAutoLayout()

    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemOrange
        return line
    }()

    // MARK: - Initialization

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func configure() {
        [title,
         lineSeparators,
        ].forEach{ addSubview($0) }

        lineSeparators.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }

        title.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(12)
        }

    }
}
