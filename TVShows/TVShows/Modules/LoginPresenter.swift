//
//  LoginPresenter.swift
//  TVShows
//
//  Created by Ivan Milicevic on 17/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginPresenter {

    // MARK: - Private properties -

    private unowned var _view: LoginViewInterface
    private var _interactor: LoginInteractorInterface
    private var _wireframe: LoginWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: LoginWireframeInterface, view: LoginViewInterface, interactor: LoginInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
}
