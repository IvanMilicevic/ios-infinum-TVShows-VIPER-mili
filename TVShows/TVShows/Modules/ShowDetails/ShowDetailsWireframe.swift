//
//  ShowDetailsWireframe.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ShowDetailsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "ShowDetails", bundle: nil)

    // MARK: - Module setup -

    init(show: Show) {
        let moduleViewController = _storyboard.instantiateViewController(ofType: ShowDetailsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ShowDetailsInteractor()
        let presenter = ShowDetailsPresenter(wireframe: self, view: moduleViewController, interactor: interactor, show: show)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ShowDetailsWireframe: ShowDetailsWireframeInterface {

    func navigate(to option: ShowDetailsNavigationOption) {

        switch option {
        case .home:
            _goToHome()
        case .addNewEpisode(let show):
            _goToAddNewEpisode(show: show)
        }
    }

    private func _goToHome() {
        navigationController?.popViewController(animated: true)
    }

    private func _goToAddNewEpisode(show: Show) {
        let wireframe = AddNewEpisodeWireframe(show: show)

        navigationController?.pushWireframe(wireframe)
    }
}
