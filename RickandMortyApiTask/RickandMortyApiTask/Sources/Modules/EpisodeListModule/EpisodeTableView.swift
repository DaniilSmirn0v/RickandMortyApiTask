//
//  EpisodeTableView.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit
import SnapKit

class EpisodeTableView: UIView {
    // MARK: - Views

    lazy var episodeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EpisodeCustomCell.self, forCellReuseIdentifier: EpisodeCustomCell.reuseId)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .systemOrange
        return tableView
    }()

    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Private methods

extension EpisodeTableView {
    private func setupHierarchy() {
        [
            episodeTableView
        ].forEach { addSubview($0)}
    }

    private func setupLayout() {
        episodeTableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

