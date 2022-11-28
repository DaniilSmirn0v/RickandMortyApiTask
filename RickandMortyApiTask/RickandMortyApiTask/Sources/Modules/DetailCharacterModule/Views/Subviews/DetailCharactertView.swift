//
//  DetailCharactertView.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import SnapKit

final class DetailCharactertView: UIView {
    // MARK: - Properties

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(DetailCharactertCell.self, forCellReuseIdentifier: DetailCharactertCell.reuseID)
        tableView.register(DetailCharactertHeader.self, forHeaderFooterViewReuseIdentifier: DetailCharactertHeader.reuseId)
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }().setupAutoLayout()

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupTableView()
    }

    // MARK: - Private

    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
}


