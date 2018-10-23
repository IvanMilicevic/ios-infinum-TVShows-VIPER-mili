//
//  AddNewEpisodeWireframe.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class AddNewEpisodeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "AddNewEpisode", bundle: nil)
    private weak var _delegate: ShowDetailsPresenterInterface?

    // MARK: - Module setup -

    init(show: Show, delegate: ShowDetailsPresenterInterface) {
        let moduleViewController = _storyboard.instantiateViewController(ofType: AddNewEpisodeViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = AddNewEpisodeInteractor()
        let presenter = AddNewEpisodePresenter(wireframe: self, view: moduleViewController, interactor: interactor, show: show)
        moduleViewController.presenter = presenter
        _delegate = delegate
    }


}

// MARK: - Extensions -

extension AddNewEpisodeWireframe: AddNewEpisodeWireframeInterface {

    func navigate(to option: AddNewEpisodeNavigationOption) {

        switch option {
        case .showDetails(let didAdd):
            _returnToShowDetails(didAdd: didAdd)
        }

    }

    private func _returnToShowDetails(didAdd: Bool) {

        if didAdd {
            guard let _delegate = _delegate else {
                return
            }
            _delegate.reloadData()
        }
        navigationController?.popViewController(animated: true)
    }
}
