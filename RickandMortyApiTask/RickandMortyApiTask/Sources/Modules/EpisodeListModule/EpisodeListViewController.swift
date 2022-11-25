//
//  EpisodeListViewController.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit

class EpisodeListViewController: UIViewController {

    //MARK: - Properties
    private var episodeTablelView: EpisodeTableView? {
        guard isViewLoaded else { return nil }
        return view as? EpisodeTableView
    }
    private var cellViewModel: [CellViewModel] = []
    var presenter: EpisodeListViewInputProtocol

    //MARK: - Views

    //MARK: - Initialize
    init(presenter: EpisodeListViewInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - LifeCycle
    override func loadView() {
        view = EpisodeTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTablelView?.episodeTableView.delegate = self
        episodeTablelView?.episodeTableView.dataSource = self
        title = "Episodes"
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.getData()
    }
}
// MARK: - UITableViewDataSource
extension EpisodeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCustomCell.reuseId, for: indexPath) as? EpisodeCustomCell else { return UITableViewCell() }
        let model = cellViewModel[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: model)
        return cell
    }
}


//MARK: - UITableViewDelegate
extension EpisodeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(EpisodeDetailViewController(), animated: true)
    }
}

extension EpisodeListViewController: EpisodeListViewOutputProtocol {
    func configure(with viewModels: [CellViewModel]) {
        Task {@MainActor in
            cellViewModel = viewModels
            episodeTablelView?.episodeTableView.reloadData()
        }
    }

    func failure(error: NetworkError) {
        print(error.localizedDescription)
    }
}
