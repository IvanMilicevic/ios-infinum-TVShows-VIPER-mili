//
//  AddNewEpisodeInterfaces.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum AddNewEpisodeNavigationOption {
    case showDetails
}

protocol AddNewEpisodeWireframeInterface: WireframeInterface {
    func navigate(to option: AddNewEpisodeNavigationOption)
}

protocol AddNewEpisodeViewInterface: ViewInterface {
}

protocol AddNewEpisodePresenterInterface: PresenterInterface {
    func didPressBackButton()
    func didPressAddButton()
}

protocol AddNewEpisodeInteractorInterface: InteractorInterface {
}
