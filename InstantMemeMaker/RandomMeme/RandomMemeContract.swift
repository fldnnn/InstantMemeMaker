//
//  RandomMemeContract.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import Foundation

protocol ViewToPresenterRandomMemeProcotol {
    var randomMemeInteractor: PresenterToInteractorRandomMemeProcotol? {get set}
    var randomMemeView: PresenterToViewRandomMemeProcotol? {get set}
    
    func onCreateButtonPressed()
}

protocol PresenterToInteractorRandomMemeProcotol {
    var randomMemePresenter: InteractorToPresenterRandomMemeProcotol? {get set}
    
    func getMemes()
}

protocol InteractorToPresenterRandomMemeProcotol {
    
    func didDataFetch(with memes: [Meme])
}

protocol PresenterToViewRandomMemeProcotol {
    func updateView(with memes: [Meme])
}

protocol PresenterToRouterRandomMemeProcotol {
    static func createModule(ref: RandomMemeViewController)
}
