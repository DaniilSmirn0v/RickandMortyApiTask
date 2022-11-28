//
//  DetailCharacterViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import Kingfisher

final class DetailCharactertViewController: UIViewController {
    // MARK: - Typealias

    typealias Snapshot = NSDiffableDataSourceSnapshot<TableViewSection, AnyHashable>
    typealias DataSource = UITableViewDiffableDataSource<TableViewSection, AnyHashable>

    // MARK: - Properties

    enum TableViewSection: String, CaseIterable, Hashable {
        case image = "image"
        case info = "info"
    }

    var presenter: DetailCharacterViewOutputProtocol?
    var character = [
        CharactInfo(status: "Status", info: ""),
        CharactInfo(status: "Gender", info: ""),
        CharactInfo(status: "Species", info: ""),
    ]
    
    private var detailCharactertView: DetailCharactertView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharactertView
    }

    private lazy var dataSource = makeDataSource()
    private var characters = [Character?]()
    private var cellViewModel: ViewModel?
    private var tableViewModelCell = [ViewModel]()

    // MARK: - Lifecycle

    override func loadView() {
        view = DetailCharactertView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurate()
    }
}

// MARK: - UITableViewDelegate

extension DetailCharactertViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 0 {
            return 50
        } else {
            return ((detailCharactertView?.frame.width ?? 0) - 40)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailCharactertHeader.reuseId) as! DetailCharactertHeader
        if section != 0 {
            cell.title.text = "Info"
        } else {
            cell.title.text = "Appearence"
        }
        return cell
    }
}

// MARK: - Private

extension DetailCharactertViewController {

    private func configurate() {
        detailCharactertView?.tableView.delegate = self
        guard let presenter = presenter else { return }
        characters = [presenter.getCharacter()]
        updateSnapshot(animatingChange: false, characters: characters, character: character)
    }

    private func makeDataSource() -> DataSource {

        let dataSource = DataSource(tableView: detailCharactertView?.tableView ?? UITableView()) { tableView, indexPath, item in

            if item is Character? {

                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DetailCharactertCell.reuseID,
                    for: indexPath
                ) as? DetailCharactertCell else { return UITableViewCell() }

                guard let vm = self.cellViewModel else { return UITableViewCell() }

                cell.configure(with: vm)
                return cell

            } else if item is CharactInfo {

                let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

                let model = self.tableViewModelCell[indexPath.item]

                cell.configureCell(with: model)
                cell.detailTextLabel?.textColor = .systemOrange
                
                return cell
            } else {
                fatalError("Unknown cell type")
            }
        }
        return dataSource
    }

    private func updateSnapshot(animatingChange: Bool = true, characters: [Character?], character: [CharactInfo]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.image, .info])
        snapshot.appendItems(characters, toSection: .image)
        snapshot.appendItems(character, toSection: .info)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - DetailCharacterViewInputProtocol

extension DetailCharactertViewController:
    DetailCharacterViewInputProtocol {

    func configure(with viewModelsCell: ViewModel, data: Character, with tableViewModelCell: [ViewModel]) {
        Task { @MainActor in
            title = "\(data.name)"
            cellViewModel = viewModelsCell
            self.tableViewModelCell = tableViewModelCell
//            detailCharactertView?.tableView.reloadData()
        }
    }
}
