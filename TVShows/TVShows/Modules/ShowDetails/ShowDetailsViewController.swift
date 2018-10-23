//
//  ShowDetailsViewController.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ShowDetailsViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet private weak var showDetailsTableView: UITableView!{
        didSet {
            showDetailsTableView.dataSource = self
            showDetailsTableView.delegate = self
            showDetailsTableView.estimatedRowHeight = 100
            showDetailsTableView.rowHeight = UITableView.automaticDimension
            showDetailsTableView.separatorStyle = .none
            showDetailsTableView.contentInset.bottom = 90
        }
    }

    var presenter: ShowDetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
	
    @IBAction func didPressBackButton(_ sender: Any) {
        presenter.didPressBackButton()
    }

    @IBAction func didPressAddNewEpisodeButton(_ sender: Any) {
        presenter.didPressAddNewEpisodeButton()
    }


}

// MARK: - Extensions -

extension ShowDetailsViewController: ShowDetailsViewInterface {
    
    func reloadData() {
        showDetailsTableView.reloadData()
    }



}

extension ShowDetailsViewController: UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + presenter.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = showDetailsTableView.dequeueReusableCell(
                withIdentifier: "ShowDetailsImageCell",
                for: indexPath
                ) as! ShowDetailsImageCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = showDetailsTableView.dequeueReusableCell(
                withIdentifier: "ShowDetailsDescriptionCell",
                for: indexPath
                ) as! ShowDetailsDescriptionCell
            guard let showDetails = presenter.getShowDetails() else {
                return cell
            }
            cell.configure(with: showDetails, episodesCount: presenter.getEpisodesCount())
            cell.selectionStyle = .none
            return cell
        default:
            let cell = showDetailsTableView.dequeueReusableCell(
                withIdentifier: "ShowDetailsEpisodeCell",
                for: indexPath
                ) as! ShowDetailsEpisodeCell
            cell.configure(with: presenter.getEpisode(at: indexPath.row-2))
            return cell
        }
    }


}

extension ShowDetailsViewController: UITableViewDelegate {

}
