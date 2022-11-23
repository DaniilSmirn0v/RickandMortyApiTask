//
//  LocationDetailHeader.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit
import SnapKit

class LocationDetailHeader: UICollectionReusableView {
    // MARK: - Properties

    lazy var charactertImage = UIImageView().setup().setupAutoLayout()

    var title = UILabel().setup(textAlignment: .left,
                                font: 20,
                                text: "ссccccc",
                                color: .white).setupAutoLayout()

    var title1 = UILabel().setup(textAlignment: .left,
                                font: 20,
                                text: "ссccccc",
                                color: .white).setupAutoLayout()

    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemOrange
        return line
    }()

    var infoTitle = UILabel().setup(textAlignment: .left,
                                font: 32,
                                text: "ссccccc",
                                color: .white).setupAutoLayout()

    static let reuseId = "LocationDetailHeader"

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private func  setupHierarchy() {
        [charactertImage,
         title,
         title1,
         lineSeparators,
         infoTitle,
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        charactertImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.height.equalTo(charactertImage.snp.width)
        }

        title.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(charactertImage.snp.bottom).offset(8)
        }

        title1.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(title.snp.bottom).offset(8)
        }

        lineSeparators.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(title1.snp.bottom).offset(8)
            make.height.equalTo(2)
        }

        infoTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(lineSeparators.snp.bottom).offset(8)
        }
    }
}
