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

    private var detailCharactertView: DetailCharactertView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharactertView
    }

    private lazy var dataSource = makeDataSource()
    private var characters = [Character?]()
    private var character = [CharactInfo]()
    private var characterInfo: Character?

    private var status: String?
    private var statusColor: String?
    private var species: String?
    private var gender: String?

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
        characterInfo = self.presenter?.getCharacterInfo()
        characters = [self.presenter?.getCharacterInfo()]
        title = self.presenter?.getCharacterName()
        setupCharacterInfo()
        updateSnapshot(animatingChange: false, characters: characters, character: character)
    }

    private func setupCharacterInfo() {
        guard let status = characterInfo?.status.rawValue,
              let statusColor = characterInfo?.statusColor,
              let gender = characterInfo?.gender.rawValue,
              let species = characterInfo?.species.rawValue else { return }

        character = [
            CharactInfo(status: "\(statusColor)  Status", info: status),
            CharactInfo(status: "🧬  Gender", info: gender),
            CharactInfo(status: "👤  Species", info: species),
        ]
    }

    private func makeDataSource() -> DataSource {

        return DataSource(tableView: detailCharactertView?.tableView ?? UITableView()) { tableView, indexPath, item in

            if let character = item as? Character? {

                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DetailCharactertCell.reuseID,
                    for: indexPath
                ) as? DetailCharactertCell else { return UITableViewCell() }
                let url = URL(string: character?.image ?? "")
                cell.charactertImage.kf.setImage(with: url)
                return cell

            } else if let characterInfo = item as? CharactInfo {

                let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
                cell.textLabel?.text = characterInfo.status
                cell.detailTextLabel?.text = characterInfo.info
                cell.detailTextLabel?.textColor = .systemOrange
                return cell

            } else {
                fatalError("Unknown cell type")
            }
        }
    }

    private func updateSnapshot(animatingChange: Bool = true, characters: [Character?], character: [CharactInfo]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.image, .info])
        snapshot.appendItems(characters, toSection: .image)
        snapshot.appendItems(character, toSection: .info)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

