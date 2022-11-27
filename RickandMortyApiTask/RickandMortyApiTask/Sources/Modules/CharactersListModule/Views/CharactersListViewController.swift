//
//  CharactersListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit
import Kingfisher

final class CharactersListViewController: UIViewController {
    // MARK: - Typealias
    
    private typealias Snapshot = NSDiffableDataSourceSnapshot<CharactersListSection, Character>
    private typealias DataSource = UICollectionViewDiffableDataSource<CharactersListSection, Character>
    
    // MARK: - Properties

    private enum CharactersListSection {
        case main
    }

    var presenter: CharactersListViewOutputProtocol?

    private var charactersView: CharactersCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersCollectionView
    }

    private lazy var dataSource = makeDataSource()
    private var characters = [Character]()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = CharactersCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        charactersView?.collectionView.delegate = self
        characters = self.presenter?.getCharacters() ?? [Character]()
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
            let stringURL = self.characters[indexPath.row].image
            cell.characterImageView.loadImage(with: stringURL)
            return cell
        }
        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = true, characters: [Character]) {
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
        tapItem(id)
    }
}

// MARK: - CharactersListViewInputProtocol

extension CharactersListViewController: CharactersListViewInputProtocol {

    func tapItem(_ id: Int) {
        presenter?.didSelectItem(id)
    }

}
