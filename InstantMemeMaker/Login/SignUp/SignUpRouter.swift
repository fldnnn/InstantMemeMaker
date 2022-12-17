//
//  SignUpRouter.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 17.12.2022.
//

import Foundation

class SignUpRouter: PresenterToRouterSignUpProtocol {
    static func createModule(ref: SignUpViewController) {
        ref.signUpPresenter = SignUpPresenter()
        ref.signUpPresenter?.interactor = SignUpInteractor()
    }
}
