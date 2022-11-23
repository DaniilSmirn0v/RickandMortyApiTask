//
//  EpisodeDetailHeaderView.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

class EpisodeDetailHeaderView: UICollectionReusableView {
    //MARK: - Properties
    static let reuseId = "EpisodeDetailHeaderView"

    //MARK: - Views
    private lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "📺 Episode:"
        return label
    }()

    lazy var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "S01E01"
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private lazy var airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "📅 Air date:"
        return label
    }()


    lazy var episodeDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "December 2, 2013"
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    lazy var titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Characters in This Episode:"
        label.font = .systemFont(ofSize: 25, weight: .bold)
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
extension EpisodeDetailHeaderView {
    private func setupHierarchy(){
        [
            episodeLabel,
            airDateLabel,
            episodeNameLabel,
            episodeDateLabel,
            titleHeader
        ].forEach { addSubview($0)}
    }

    private func setupLayout() {
        episodeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview()
        }

        episodeNameLabel.snp.makeConstraints { make in
            make.left.equalTo(episodeLabel.snp.right).offset(10)
            make.top.equalTo(episodeLabel.snp.top)
        }

        airDateLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeLabel.snp_bottomMargin).offset(16)
            make.left.equalTo(episodeLabel.snp.left)
        }

        episodeDateLabel.snp.makeConstraints { make in
            make.top.equalTo(airDateLabel.snp.top)
            make.left.equalTo(airDateLabel.snp.right).offset(10)
        }

        titleHeader.snp.makeConstraints { make in
            make.top.equalTo(airDateLabel.snp.bottom).offset(10)
            make.left.equalTo(airDateLabel.snp.left)
        }
    }

}
