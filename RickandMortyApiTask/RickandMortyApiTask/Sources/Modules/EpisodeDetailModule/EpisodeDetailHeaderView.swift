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
        label.font = .systemFont(ofSize: 17, weight: .medium)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "tv")
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "Episode:")
        myString.append(attachmentString)
        label.attributedText = myString
        return label
    }()

    private lazy var airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "calendar")
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "Air date:")
        myString.append(attachmentString)
        label.attributedText = myString
        return label
    }()

    lazy var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "S01E01"
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    lazy var episodeDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "December 2, 2013"
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 17, weight: .regular)
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
            episodeDateLabel
        ].forEach { addSubview($0)}
    }

    private func setupLayout() {
        episodeLabel.snp.makeConstraints { make in
            make.left.top.equalTo(16)
        }
        episodeNameLabel.snp.makeConstraints { make in
            make.left.equalTo(episodeLabel.snp.right).offset(10)
            make.top.equalTo(episodeLabel)
            make.right.equalToSuperview().offset(-16)
        }

        airDateLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeLabel.snp.bottom).offset(10)
            make.left.equalTo(episodeLabel)
            make.bottom.equalTo(16)
        }

        episodeDateLabel.snp.makeConstraints { make in
            make.left.equalTo(airDateLabel.snp.right).offset(10)
            make.top.equalTo(airDateLabel)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().inset(-16)
        }
    }

}
