//
//  EpisodeListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit

class EpisodeListViewController: UIViewController {
    //MARK: - Properties
    private var hotelDetailView: EpisodeTableView? {
        guard isViewLoaded else { return nil }
        return view as? EpisodeTableView
    }

    //MARK: - Views

    //MARK: - LifeCycle
    override func loadView() {
        view = EpisodeTableView()
        hotelDetailView?.episodeTableView.dataSource = self
        hotelDetailView?.episodeTableView.delegate = self
        title = "Episodes"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EpisodeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCustomCell.reuseId, for: indexPath) as? EpisodeCustomCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}

//MARK: - UITableViewDelegate
extension EpisodeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

