//
//  HomeViewController.swift
//  TVShows
//
//  Created by Ivan Milicevic on 18/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var homeTableView: UITableView! {
        didSet {
            homeTableView.dataSource = self
            homeTableView.delegate = self
            homeTableView.estimatedRowHeight = 44
            homeTableView.separatorStyle = .none
        }
    }

    var presenter: HomePresenterInterface!

    private var showsArray: [Show] = []

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsArray.count //todo
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(
            withIdentifier: "TVShowsCell",
            for: indexPath
            ) as! HomeCell

        cell.configure(with: showsArray[indexPath.row], loginData: loginData)
        return cell
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}

extension HomeViewController: UITableViewDelegate {

}
