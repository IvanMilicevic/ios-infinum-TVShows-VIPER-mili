//
//  HomeInterfaces.swift
//  TVShows
//
//  Created by Ivan Milicevic on 18/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum HomeNavigationOption {
    case login
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
}

protocol HomeInteractorInterface: InteractorInterface {
}
