//
//  EpisodeDetailsWireframe.swift
//  TVShows
//
//  Created by Ivan Milicevic on 23/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class EpisodeDetailsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "EpisodeDetails", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: EpisodeDetailsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = EpisodeDetailsInteractor()
        let presenter = EpisodeDetailsPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension EpisodeDetailsWireframe: EpisodeDetailsWireframeInterface {

    func navigate(to option: EpisodeDetailsNavigationOption) {
    }
}
