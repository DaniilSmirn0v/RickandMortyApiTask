//
//  CharactersListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit
import Kingfisher

final class CharactersListViewController: UIViewController {
    // MARK: - Properties

    var presenter: CharactersListViewOutputProtocol?

    private var charactersView: CharactersCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersCollectionView
    }

    private var cellViewModels = [ViewModel]()
    
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
        charactersView?.collectionView.dataSource = self
        title = "Characters"
    }
}

// MARK: - UICollectionViewDataSource

extension CharactersListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionCell.identifier, for: indexPath) as? CharactersCollectionCell else { return UICollectionViewCell() }

        let model = self.cellViewModels[indexPath.row]
        cell.configure(with: model)

        return cell
    }

}


// MARK: - UICollectionViewDelegate

extension CharactersListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let id = presenter?.getCharacters()[indexPath.row].id
        guard let id = id else { return }
        tapItem(id)
    }
}

// MARK: - CharactersListViewInputProtocol

extension CharactersListViewController: CharactersListViewInputProtocol {

    func tapItem(_ id: Int) {
        presenter?.didSelectItem(id)
    }

    func configure(with viewModels: [ViewModel]) {
        Task { @MainActor in
            cellViewModels = viewModels
            charactersView?.collectionView.reloadData()
        }
    }
    
}

