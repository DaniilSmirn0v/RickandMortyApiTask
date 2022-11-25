//
//  EpisodeCustomCell.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit


protocol CellViewModel {}

struct EpisodeListCellViewModel: CellViewModel {
    let episodeNumberLable: String
    let episodeNameLabel: String
    let episodeLabel: String
    let dateLabel: String
}

protocol CellConfigurable where Self: UITableViewCell {
    func configure(with viewModel: CellViewModel)
}

class EpisodeCustomCell: UITableViewCell {
    //MARK: - Properties
    static let reuseId = "EpisodeCustomCell"

    //MARK: - Views
    var episodeNumberLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 70, weight: .heavy)
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
        label.text = "1"
        label.textAlignment = .center
        label.backgroundColor = .systemOrange
        return label
    }()

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()

    var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Pilot"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "S01E01"
        return label
    }()

    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "December 2, 2013"
        return label
    }()

    //MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private methods
extension EpisodeCustomCell {
    private func setupHierarchy() {
        [
            episodeNumberLable,
            stackView
        ].forEach{ addSubview($0) }

        [
            episodeNameLabel,
            episodeLabel,
            dateLabel
        ].forEach { stackView.addArrangedSubview($0) }
    }

    private func setupLayout() {
        episodeNumberLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-13)
            make.left.equalToSuperview().offset(13)
            make.width.equalTo(140)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(episodeNumberLable)
            make.left.equalTo(episodeNumberLable.snp.right).offset(10)
            make.right.equalToSuperview().inset(13)
        }
    }
}

// MARK: - CellConfigurable
extension EpisodeCustomCell: CellConfigurable {
    func configure(with viewModel: CellViewModel) {
        guard let vm = viewModel as? EpisodeListCellViewModel else { return }
        episodeNumberLable.text = vm.episodeNumberLable
        episodeNameLabel.text = vm.episodeNameLabel
        episodeLabel.text = vm.episodeLabel
        dateLabel.text = vm.dateLabel
    }
}
