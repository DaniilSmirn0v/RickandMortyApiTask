//
//  DetailCharactertHeader.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

class DetailCharactertHeader: UITableViewHeaderFooterView {
    // MARK: - Properties
    
    var title = UILabel().setup(textAlignment: .left,
                                font: .systemFont(ofSize: 17, weight: .medium),
                                text: "ссccccc").setupAutoLayout()
    
    static let reuseId = "HeaderView"
    
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
            make.top.left.right.bottom.equalToSuperview().inset(20)
        }
    }
}
