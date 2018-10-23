//
//  LoginInteractor.swift
//  TVShows
//
//  Created by Ivan Milicevic on 18/10/2018.
//  Copyright (c) 2018 Ivan Milicevic. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire
import CodableAlamofire

final class LoginInteractor {
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {

    func loginUser(with email: String, password: String, completion: @escaping (Result<LoginData>) -> ()) {
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]

        Alamofire
            .request("https://api.infinum.academy/api/users/sessions",
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default)
            .validate()
            .responseDecodableObject(keyPath: "data", decoder: JSONDecoder()) { (response: DataResponse<LoginData>) in
                completion(response.result)
            }
    }

    func registerUser(with email: String, password: String, completion: @escaping (Result<User>) -> ()) {
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]

        Alamofire
            .request("https://api.infinum.academy/api/users",
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default)
            .validate()
            .responseDecodableObject(keyPath: "data", decoder: JSONDecoder()) { (response: DataResponse<User>) in
                completion(response.result)
        }
    }

}
