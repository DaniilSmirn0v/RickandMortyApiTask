//
//  CharactersListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit

class CharactersListViewController: UIViewController {
    //MARK: - Properties
    private var charactersView: CharactersCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersCollectionView
    }

    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Characters>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Characters>
    private lazy var dataSource = makeDataSource()
    private var characters = [Characters(name: "Привет как дела "),Characters(name: "Привет как дела "),Characters(name: "Привет как дела "),Characters(name: "Привет как дела ")]

    //MARK: - Life Cycle
    override func loadView() {
        view = CharactersCollectionView()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        charactersView?.collectionView.delegate = self
        title = "Characters"
        updateSnapshot(animatingChange: false, characters: characters)
    }

}

//MARK: - UICollectionViewDiffableDataSource
extension CharactersListViewController {
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: charactersView!.collectionView) { collectionView, indexPath, character in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionCell.identifier, for: indexPath) as? CharactersCollectionCell else { return UICollectionViewCell() }
            cell.characterNameLabel.text = character.name
            return cell
        }
        return dataSource
    }

    func updateSnapshot(animatingChange: Bool = true, characters: [Characters]) {

        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(characters)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

//MARK: - UICollectionViewDelegate
extension CharactersListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailCharactertViewController(), animated: true)
    }
}
