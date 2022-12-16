//
//  RandomMemePresenter.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import Foundation

class RandomMemePresenter: ViewToPresenterRandomMemeProcotol {
  
    var randomMemeInteractor: PresenterToInteractorRandomMemeProcotol?
    
    var randomMemeView: PresenterToViewRandomMemeProcotol?
    
    func onCreateButtonPressed() {
        randomMemeInteractor?.getMemes()
    }
}

extension RandomMemePresenter: InteractorToPresenterRandomMemeProcotol {
    func didDataFetch(with memes: [Meme]) {
        randomMemeView?.updateView(with: memes)
    }
}
