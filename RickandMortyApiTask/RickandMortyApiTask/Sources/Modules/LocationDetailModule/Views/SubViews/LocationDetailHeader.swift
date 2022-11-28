//
//  LocationDetailHeader.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit
import SnapKit

struct LocationDetailHeaderViewModel: ViewModel {
    let episodeNameLabel: String
    let episodeDateLabel: String
}

protocol LocationDetailHeaderViewConfigurable where Self: UICollectionReusableView {
    func configure(with viewModel: ViewModel)
}

final class LocationDetailHeader: UICollectionReusableView {
    // MARK: - Properties

    static let reuseId = "LocationDetailHeader"

    lazy var charactertImage = UIImageView()
        .setup()
        .setupAutoLayout()

    lazy var typeInfo = UILabel()
        .setup(textAlignment: .left,
               font: 20,
               color: .systemOrange)
        .setupAutoLayout()

    lazy var dimensionInfo = UILabel()
        .setup(textAlignment: .left,
               font: 20,
               color: .systemOrange)
        .setupAutoLayout()

    private lazy var locationInfoLabel = UILabel()
        .setup(textAlignment: .left,
               font: 30,
               fontWeight: .bold,
               text: "Location",
               color: .white)
        .setupAutoLayout()

    private lazy var type = UILabel()
        .setup(textAlignment: .left,
               font: 18,
               fontWeight: .semibold,
               text: "🪐 Type:",
               color: .white)
        .setupAutoLayout()

    private lazy var dimension = UILabel()
        .setup(textAlignment: .left,
               font: 18,
               fontWeight: .semibold,
               text: "✨ Dimension:",
               color: .white)
        .setupAutoLayout()

    private lazy var residentInfoLabel = UILabel()
        .setup(textAlignment: .left,
               font: 30,
               fontWeight: .bold,
               text: "Resident in This Location",
               color: .white)
        .setupAutoLayout()

    private lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemOrange
        return line
    }()

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
        [locationInfoLabel,
         charactertImage,
         type,
         dimension,
         typeInfo,
         dimensionInfo,
         lineSeparators,
         residentInfoLabel,
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        locationInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview()
        }

        charactertImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(0)
            make.top.equalTo(locationInfoLabel.snp.bottom).offset(8)
            make.height.equalTo(charactertImage.snp.width)
        }

        type.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(charactertImage.snp.bottom).offset(8)
        }

        typeInfo.snp.makeConstraints { make in
            make.left.equalTo(type.snp.right).offset(10)
            make.top.equalTo(charactertImage.snp.bottom).offset(8)
        }

        dimension.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(typeInfo.snp.bottom).offset(8)
        }

        dimensionInfo.snp.makeConstraints { make in
            make.left.equalTo(dimension.snp.right).offset(10)
            make.top.equalTo(typeInfo.snp.bottom).offset(8)
        }

        lineSeparators.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(0)
            make.top.equalTo(dimensionInfo.snp.bottom).offset(8)
            make.height.equalTo(1)
        }

        residentInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(lineSeparators.snp.bottom).offset(8)
        }
    }
}

extension LocationDetailHeader: LocationDetailHeaderViewConfigurable {
    func configure(with viewModel: ViewModel) {
        guard let vm = viewModel as? LocationDetailHeaderViewModel else { return }
        let image = vm.episodeNameLabel
        charactertImage.image = UIImage(named: image)
        typeInfo.text =  " \(vm.episodeNameLabel)"
        dimensionInfo.text = vm.episodeDateLabel
    }
}
