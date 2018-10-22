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

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

    }

    private func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Shows"
        let img = UIImage(named: "ic-logout")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: img,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(logout))
    }

    @objc func logout() {
        presenter.didPressLogout()
    }
	
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {


    func reloadData() {
        homeTableView.reloadData()
        configureNavigationBar()
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(
            withIdentifier: "TVShowsCell",
            for: indexPath
            ) as! HomeCell

        cell.configure(with: presenter.getShow(at: indexPath.row))
        return cell
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            presenter.removeShow(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)

        }
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "ShowDetails", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController_ShowDetails")
//            as! ShowDetailsViewController
//
//        viewController.configure(id: showsArray[indexPath.row].id, login: loginData!)
//        tableView.deselectRow(at: indexPath, animated: true)
//        navigationController?.pushViewController(viewController, animated: true)
//    }

}
