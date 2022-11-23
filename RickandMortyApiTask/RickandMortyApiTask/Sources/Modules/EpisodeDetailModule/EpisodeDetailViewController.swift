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


}
