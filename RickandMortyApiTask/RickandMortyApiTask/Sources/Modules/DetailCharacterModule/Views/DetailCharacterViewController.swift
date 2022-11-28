//
//  DetailCharacterViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import UIKit
import Kingfisher

final class DetailCharactertViewController: UIViewController {
    // MARK: - Properties

    var presenter: DetailCharacterViewOutputProtocol?

    enum TableSection: Int {
        case image
        case info
    }
    
    private var detailCharactertView: DetailCharactertView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharactertView
    }
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

// MARK: - Private

extension DetailCharactertViewController {

    private func configurate() {
        presenter?.getData()
        detailCharactertView?.tableView.delegate = self
        detailCharactertView?.tableView.dataSource = self
    }
}

// MARK: - DetailCharacterViewInputProtocol

extension DetailCharactertViewController:
    DetailCharacterViewInputProtocol {

    func configure(
        with viewModelsCell: ViewModel,
        data: Character,
        with tableViewModelCell: [ViewModel]
    ) {
        Task { @MainActor in
            title = "\(data.name)"
            cellViewModel = viewModelsCell
            self.tableViewModelCell = tableViewModelCell
            detailCharactertView?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension DetailCharactertViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableSection = TableSection(rawValue: section)
            switch tableSection {
            case .image:
                return TableSection.info.rawValue
            case .info:
                return tableViewModelCell.count
            default:
                fatalError(StringsConstants.fatalError)
            }
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = TableSection(rawValue: indexPath.section)
       switch tableSection {
       case .image:
           let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailCharactertCell.reuseID,
            for: indexPath
           ) as? DetailCharactertCell ?? DetailCharactertCell()

           if let vm = self.cellViewModel {
               cell.configure(with: vm)
           }

           return cell
       case .info:
           let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

           let model = self.tableViewModelCell[indexPath.row]
           cell.configureCell(with: model)

           cell.detailTextLabel?.textColor = .systemOrange
           return cell
       default:
           fatalError(StringsConstants.fatalError)
       }
    }
}

// MARK: - UITableViewDelegate

extension DetailCharactertViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSection = TableSection(rawValue: indexPath.section)
        switch tableSection {
        case .image:
            return ((detailCharactertView?.frame.width ?? 0) - 40)
        case .info:
            return 50
        case .none:
            fatalError(StringsConstants.fatalError)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailCharactertHeader.reuseId) as? DetailCharactertHeader
        let tableSection = TableSection(rawValue: section)
        switch tableSection {
        case .image:
            cell?.title.text = StringsConstants.titleInfo
            cell?.lineSeparators.isHidden = true
        case .info:
            cell?.title.text = StringsConstants.titleAppearence
            cell?.lineSeparators.isHidden = false
        case .none:
            fatalError(StringsConstants.fatalError)
        }
        return cell
    }
}

// MARK: - StringsConstants

fileprivate enum StringsConstants {

    static let fatalError: String = "Unknown section"
    static let titleInfo: String = "Info"
    static let titleAppearence: String = "Appearence"
}



