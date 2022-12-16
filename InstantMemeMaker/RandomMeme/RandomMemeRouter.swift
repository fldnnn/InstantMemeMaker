//
//  RandomMemeRouter.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import Foundation

class RandomMemeRouter: PresenterToRouterRandomMemeProcotol {
    static func createModule(ref: RandomMemeViewController) {
        let presenter = RandomMemePresenter()
        
        ref.randomMemePresenterObject = presenter
        
        ref.randomMemePresenterObject?.randomMemeInteractor = RandomMemeInteractor()
        ref.randomMemePresenterObject?.randomMemeView = ref
        
        ref.randomMemePresenterObject?.randomMemeInteractor?.randomMemePresenter = presenter
    }
}
