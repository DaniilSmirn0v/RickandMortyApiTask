//
//  LocationDetailViewController.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 23.11.22.
//

import UIKit

class LocationDetailViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties

    private var locationDetailView: LocationDetailView? {
        guard isViewLoaded else { return nil }
        return view as? LocationDetailView
    }

    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Characters>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Characters>
    private lazy var dataSource = makeDataSource()

    private var characters = [Characters(name: "Привет как дела "),Characters(name: "Привет как дела "),Characters(name: "Привет как дела "),Characters(name: "Привет как дела ")]

    // MARK: - Life Cycle

    override func loadView() {
        view = LocationDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationDetailView?.collectionView.delegate = self
        title = "Characters"
        updateSnapshot(animatingChange: false, characters: characters)
        setupHeaderData()
    }
}

// MARK: - UICollectionViewDiffableDataSource

extension LocationDetailViewController {

    private func makeDataSource() -> DataSource {

        let dataSource = DataSource(collectionView: locationDetailView!.collectionView) { collectionView, indexPath, character in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationDetailCell.identifier, for: indexPath) as? LocationDetailCell else { return UICollectionViewCell() }
            cell.locationLabel.text = character.name
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

    func setupHeaderData() {
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LocationDetailHeader.reuseId,
                for: indexPath
            ) as? LocationDetailHeader else {
                      fatalError("Could not dequeue sectionHeader: \( LocationDetailHeader.reuseId)")
                  }
                  return sectionHeader
              }
    }
}

