//
//  DetailCharactertHeader.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import SnapKit

class DetailCharactertHeader: UITableViewHeaderFooterView {
    // MARK: - Properties

    var title = UILabel().setup(
        textAlignment: .left,
        font: 20,
        fontWeight: .regular,
        color: .orange
    ).setupAutoLayout()

    static let reuseId = "DetailCharactertHeader"

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
        addSubview(title)
        title.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(12)
        }
    }
}
