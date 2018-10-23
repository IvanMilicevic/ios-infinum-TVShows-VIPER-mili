//
//  CommentsInterfaces.swift
//  TVShows
//
//  Created by Ivan Milicevic on 23/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum CommentsNavigationOption {
}

protocol CommentsWireframeInterface: WireframeInterface {
    func navigate(to option: CommentsNavigationOption)
}

protocol CommentsViewInterface: ViewInterface {
}

protocol CommentsPresenterInterface: PresenterInterface {
}

protocol CommentsInteractorInterface: InteractorInterface {
}