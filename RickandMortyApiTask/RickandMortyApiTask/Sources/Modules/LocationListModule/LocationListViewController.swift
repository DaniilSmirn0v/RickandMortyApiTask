//
//  LocationListViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

class LocationListViewController: UIViewController {
    //MARK: - Properties
    
    private var locationListView: LocationListView? {
        guard isViewLoaded else { return nil }
        return view as? LocationListView
    }

    //MARK: - LifeCycle

    override func loadView() {
        view = LocationListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationListView?.collectionView.delegate = self
        locationListView?.collectionView.dataSource = self
        title = "Location"
    }
}

// MARK: - UICollectionViewDataSource

extension LocationListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LocationListCell.reuseId,
            for: indexPath
        ) as? LocationListCell else { return UICollectionViewCell() }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(LocationDetailViewController(), animated: true)
    }
}
