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

            //Guard let za self ?

            switch result {
            case .success(let shows):
                self._view.hideProgressHUD()
            case .failure(let error):
                self._view.showErrorOnProgressHUD()
                print(error)
            }


        }
        //interactor - get data
        // reload view
        print("PRESENTER VIEW DID LOAD")
    }
}
