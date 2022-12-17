//
//  SignUpPresenter.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 17.12.2022.
//

import Foundation

class SignUpPresenter: ViewToPresenterSignUpProtocol {
    var interactor: PresenterToInteractorSignUpProtocol?
    
    func onSignUpButtonPressed(email: String, password: String) {
        interactor?.signUp(email: email, password: password)
    }
}
