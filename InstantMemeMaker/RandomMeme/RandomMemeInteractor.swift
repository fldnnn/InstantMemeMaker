//
//  RandomMemeInteractor.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import Foundation
import Alamofire

class RandomMemeInteractor: PresenterToInteractorRandomMemeProcotol {
    
    var randomMemePresenter: InteractorToPresenterRandomMemeProcotol?
    
    func getMemes() {
        AF.request("https://api.imgflip.com/get_memes", method: .get).response { [weak self] response in
                    guard let self = self else {return}
                    if let data = response.data {
                        do {
                            let response = try JSONDecoder().decode(Response.self, from: data)
                            DispatchQueue.main.async {
                                guard let allMemes = response.data?.memes else {return}
                                print(allMemes)
                                self.randomMemePresenter?.didDataFetch(with: allMemes)
                            }
                        }catch{
                            print(error.localizedDescription)
                        }
                    }
                }
    }
}
