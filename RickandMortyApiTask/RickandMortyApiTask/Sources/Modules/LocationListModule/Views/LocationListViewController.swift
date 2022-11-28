//
//  LocationListViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

class LocationListViewController: UIViewController {
    // MARK: - Properties
    
    private var locationListView: LocationListView? {
        guard isViewLoaded else { return nil }
        return view as? LocationListView
    }
    private var cellViewModel: [ViewModel] = []
    private var locationData: [LocationData] = []
    var presenter: LocationListViewInputProtocol?

    // MARK: - LifeCycle

    override func loadView() {
        view = LocationListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        locationListView?.collectionView.delegate = self
        locationListView?.collectionView.dataSource = self
        title = "Location"
    }
}


//MARK: - LocationListViewOutputProtocol

extension LocationListViewController: LocationListViewOutputProtocol {
    func configure(with viewModels: [ViewModel]) {
        Task { @MainActor in
            cellViewModel = viewModels
            locationListView?.collectionView.reloadData()
        }
    }

    func failure(error: NetworkError) {
        print(error)
    }

    func tapItem(id: Int) {
        presenter?.didSelectItem(id)
    }
}

// MARK: - UICollectionViewDataSource

extension LocationListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LocationListCell.reuseId,
            for: indexPath
        ) as? LocationListCell else { return UICollectionViewCell() }

        let vm = cellViewModel[indexPath.item]
        cell.configure(with: vm)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension LocationListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let locationData = presenter?.getLocations()
        guard let id = locationData?[indexPath.item].id else { return }
        collectionView.deselectItem(at: indexPath, animated: true)
        tapItem(id: id)
    }
}
