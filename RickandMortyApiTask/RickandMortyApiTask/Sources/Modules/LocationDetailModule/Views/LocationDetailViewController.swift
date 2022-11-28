//
//  LocationDetailViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

class LocationDetailViewController: UIViewController {

    // MARK: - Properties

    private var locationDetailView: LocationDetailView? {
        guard isViewLoaded else { return nil }
        return view as? LocationDetailView
    }

    private var cellViewModel: [ViewModel] = []
    private var headerViewModel: ViewModel?
    var presenter: LocationDetailViewInputProtocol?

   

    // MARK: - Life Cycle

    override func loadView() {
        view = LocationDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        locationDetailView?.collectionView.delegate = self
        locationDetailView?.collectionView.dataSource = self
        title = "Characters"
    }
}

// MARK: - LocationDetailViewOutputProtocol

extension LocationDetailViewController: LocationDetailViewOutputProtocol {
    func configure(with viewModelsCell: [ViewModel], viewModelHeader: ViewModel, data: LocationData) {
        Task {@MainActor in
            title = "Location - \(data.name)"
            cellViewModel = viewModelsCell
            headerViewModel = viewModelHeader
            locationDetailView?.collectionView.reloadData()
        }
    }

    func selectCell(id: Int) {
        presenter?.selectCell(id: id)
    }


}

// MARK: - UICollectionViewDataSource

extension LocationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationDetailCell.identifier, for: indexPath)
                as? LocationDetailCell else { return UICollectionViewCell() }

        let vm = cellViewModel[indexPath.item]
        cell.configure(with: vm)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let  headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: LocationDetailHeader.reuseId, for: indexPath) as? LocationDetailHeader else { return UICollectionReusableView() }
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

// MARK: - UICollectionViewDelegate

extension LocationDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let characters = presenter?.getCharacters() else { return }
        let id = characters[indexPath.row].id
        selectCell(id: id)
    }
}
