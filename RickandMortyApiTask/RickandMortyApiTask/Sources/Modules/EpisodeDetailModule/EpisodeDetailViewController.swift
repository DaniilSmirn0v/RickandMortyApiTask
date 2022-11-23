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

    //MARK: - LifeCycle
    override func loadView() {
        view = EpisodeDetailCollectionView()
        episodeDetailCollectionView?.collectionView.delegate = self
        episodeDetailCollectionView?.collectionView.dataSource = self
        title = "Episode - "
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EpisodeDetailViewController: UICollectionViewDelegate {
   

}

extension EpisodeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeDetailCell.reuseId, for: indexPath) as? EpisodeDetailCell else { return UICollectionViewCell() }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: EpisodeDetailHeaderView.reuseId,
                                                                            for: indexPath)
                as? EpisodeDetailHeaderView else { return EpisodeDetailHeaderView() }


        return header
    }

}
