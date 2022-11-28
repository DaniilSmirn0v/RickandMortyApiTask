//
//  EpisodeDetailViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 23.11.2022.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    //MARK: - Properties
    private var episodeDetailCollectionView: EpisodeDetailCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? EpisodeDetailCollectionView
    }
    
    private var cellViewModel: [ViewModel] = []
    private var headerViewModel: ViewModel?
    var presenter: EpisodeDetailViewInputProtocol?
    
    //MARK: - LifeCycle
    override func loadView() {
        view = EpisodeDetailCollectionView()
        episodeDetailCollectionView?.collectionView.delegate = self
        episodeDetailCollectionView?.collectionView.dataSource = self
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        presenter?.getData()
    }
}
//MARK: - EpisodeDetailViewOutputProtocol

extension EpisodeDetailViewController: EpisodeDetailViewOutputProtocol {

    func configure(with viewModelsCell: [ViewModel], viewModelHeader: ViewModel, data: Episode) {
        Task {@MainActor in
            title = "Episode - \(data.name)"
            navigationController?.navigationBar.prefersLargeTitles = false
            cellViewModel = viewModelsCell
            headerViewModel = viewModelHeader
            episodeDetailCollectionView?.collectionView.reloadData()
        }
    }

    func selectCell(id: Int) {
        presenter?.selectCell(id: id)
    }
}
//MARK: - UICollectionViewDelegate

extension EpisodeDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let characters = presenter?.getCharacters() else { return }
        let id = characters[indexPath.row].id
        selectCell(id: id)
    }
}

//MARK: - UICollectionViewDataSource

extension EpisodeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeDetailCell.reuseId, for: indexPath) as? EpisodeDetailCell else { return UICollectionViewCell() }

        let vm = cellViewModel[indexPath.item]
        cell.configure(with: vm)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let  headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: EpisodeDetailHeaderView.reuseId, for: indexPath) as? EpisodeDetailHeaderView else { return UICollectionReusableView() }
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section > 0 {
                headerView.isHidden = true
            } else {
                if let vm = headerViewModel {
                    headerView.configure(with: vm)
                }
                return headerView
            }
        }
        return headerView
    }
}


