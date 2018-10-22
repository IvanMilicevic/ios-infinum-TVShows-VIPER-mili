//
//  HomePresenter.swift
//  TVShows
//
//  Created by Ivan Milicevic on 18/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomePresenter {

    // MARK: - Private properties -

    private unowned var _view: HomeViewInterface
    private var _interactor: HomeInteractorInterface
    private var _wireframe: HomeWireframeInterface

    private var showsArray: [Show] = []
    // MARK: - Lifecycle -

    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {

    func viewDidLoad() {
        _view.showProgressHUD()
        _interactor.fetchShows() { result in

            switch result {
            case .success(let shows):
                self._view.hideProgressHUD()
                self.showsArray = shows
                self._view.reloadData()
            case .failure(let error):
                self._view.showErrorOnProgressHUD()
                print(error)
            }
        }
    }

    func didPressLogout() {
        _wireframe.navigate(to: .login)
    }

    func numberOfRowsInSection() -> Int {
        return showsArray.count
    }

    func getShow(at index: Int) -> Show {
        return showsArray[index]
    }

    func removeShow(at index: Int) {
        showsArray.remove(at: index)
    }
}
