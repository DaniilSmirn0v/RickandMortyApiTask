//
//  DetailCharacterViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit

final class DetailCharactertViewController: UIViewController {
    // MARK: - Typealias

    typealias Snapshot = NSDiffableDataSourceSnapshot<TableViewSection, AnyHashable>
    typealias DataSource = UITableViewDiffableDataSource<TableViewSection, AnyHashable>

    // MARK: - Properties

    enum TableViewSection: String, CaseIterable, Hashable {
        case image = "image"
        case info = "info"
     }

    private var detailCharactertView: DetailCharactertView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharactertView
    }

    private lazy var dataSource = makeDataSource()
    private var characters = [
        Characters(name: "square.and.arrow.up")]
    private var apples = [
       Apple(name: "square.and.arrow.up"),
    Apple(name: "czczczcz")]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailCharactertView()
        detailCharactertView?.tableView.delegate = self
        updateSnapshot(animatingChange: false, characters: characters, apples: apples)
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
        return cell
    }
}

// MARK: - Private

extension DetailCharactertViewController {

    private func makeDataSource() -> DataSource {

        return DataSource(tableView: detailCharactertView?.tableView ?? UITableView()) { tableView, indexPath, item in

            if let character = item as? Characters {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCharactertCell.reuseID, for: indexPath) as? DetailCharactertCell else { return UITableViewCell() }
                cell.charactertImage.image = UIImage(systemName: character.name)
                return cell
            } else if let apple = item as? Apple {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.textLabel?.text = "🟢   \(apple.name)"
                return cell
            } else {
                fatalError("Unknown cell type")
            }
        }
    }

    private func updateSnapshot(animatingChange: Bool = true, characters: [Characters], apples: [Apple]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.image, .info])
        snapshot.appendItems(characters, toSection: .image)
        snapshot.appendItems(apples, toSection: .info)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

