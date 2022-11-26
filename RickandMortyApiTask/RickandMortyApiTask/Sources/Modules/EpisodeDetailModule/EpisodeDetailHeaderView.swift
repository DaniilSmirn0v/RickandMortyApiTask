//
//  EpisodeDetailHeaderView.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

struct EpisodeDetailHeaderViewModel: ViewModel {
    let episodeNameLabel: String
    let episodeDateLabel: String
    let titleHeader: String
}

protocol EpisodeDetailHeaderViewConfigurable where Self: UICollectionReusableView {
    func configure(with viewModel: ViewModel)
}

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
        backgroundColor = .black
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.layer.cornerRadius = 13
        self.clipsToBounds = true
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
            make.top.equalToSuperview().offset(10)
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

extension EpisodeDetailHeaderView: EpisodeDetailHeaderViewConfigurable {
    func configure(with viewModel: ViewModel) {
        guard let vm = viewModel as? EpisodeDetailHeaderViewModel else { return }
        titleHeader.text = vm.titleHeader
        episodeNameLabel.text = vm.episodeNameLabel
        episodeDateLabel.text = vm.episodeDateLabel
    }


}
