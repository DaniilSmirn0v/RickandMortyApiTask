//
//  CharactersListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit

class CharactersListViewController: UIViewController {
    // MARK: - Typealias

    typealias Snapshot = NSDiffableDataSourceSnapshot<CharactersListSection, Results>
    typealias DataSource = UICollectionViewDiffableDataSource<CharactersListSection, Results>

    // MARK: - Properties

    enum CharactersListSection {
        case main
    }

    let urlsessiopn = DefaultNetworkClient()

    private var charactersView: CharactersCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersCollectionView
    }

    private var presenter: CharactersListViewOutputProtocol?

    private lazy var dataSource = makeDataSource()
    private var characters = [Results]()

    // MARK: - Life Cycle

    override func loadView() {
        view = CharactersCollectionView()
    }

    init(presenter: CharactersListViewOutputProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        charactersView?.collectionView.delegate = self
        characters = self.presenter?.getCharacters() ?? [Results]()
        title = "Characters"
        updateSnapshot(animatingChange: false, characters: characters)
    }
}

// MARK: - UICollectionViewDiffableDataSource

extension CharactersListViewController {
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: charactersView!.collectionView) { collectionView, indexPath, character in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionCell.identifier, for: indexPath) as? CharactersCollectionCell else { return UICollectionViewCell() }
            cell.characterNameLabel.text = self.characters[indexPath.row].name
            return cell
        }
        return dataSource
    }

    func updateSnapshot(animatingChange: Bool = true, characters: [Results]) {

        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(characters)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - UICollectionViewDelegate

extension CharactersListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let id = characters[indexPath.row].id
        presenter?.didSelectItem(id)
    }
}

// MARK: - CharactersListViewInputProtocol

extension CharactersListViewController: CharactersListViewInputProtocol {

   
   
}
