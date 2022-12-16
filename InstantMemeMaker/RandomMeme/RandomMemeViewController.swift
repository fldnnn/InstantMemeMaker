//
//  RandomMemeViewController.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import UIKit
import Kingfisher

class RandomMemeViewController: UIViewController {

    @IBOutlet weak var randomMemeImageView: UIImageView!
    @IBOutlet weak var randomTextLabel: UILabel!
    
    var randomMemePresenterObject: ViewToPresenterRandomMemeProcotol?
    var urls = [String]()
    var texts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RandomMemeRouter.createModule(ref: self)
    }
    
    @IBAction func createMeme(_ sender: Any) {
        randomMemePresenterObject?.onCreateButtonPressed()        
    }
}

extension RandomMemeViewController: PresenterToViewRandomMemeProcotol {
    func updateView(with memes: [Meme]) {
        
        for meme in memes {
            //print(meme.url)
            if let url = meme.url {
                urls.append(url)
            }
            if let text = meme.name {
                texts.append(text)
            }
        }
//        let names = ["Zoey", "Chloe", "Amani", "Amaia"]
//        let randomName = names.randomElement()!
        
        let url = urls.randomElement()!
        let text = texts.randomElement()!
        
        if let url = URL(string: url) {
            DispatchQueue.main.async {
                self.randomMemeImageView.kf.setImage(with: url)
            }
        }
        randomTextLabel.text = text
    }
}
