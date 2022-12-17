//
//  RandomMemeViewController.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import UIKit
import Kingfisher
//import MobileCoreServices

class RandomMemeViewController: UIViewController {

    @IBOutlet weak var randomMemeImageView: UIImageView!
    @IBOutlet weak var randomTextLabel: UILabel!
    @IBOutlet weak var memeTextField: UITextField!
    
    var randomMemePresenterObject: ViewToPresenterRandomMemeProcotol?
    var urls = [String]()
    var texts = [String]()
    var url: String?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RandomMemeRouter.createModule(ref: self)
        randomTextLabel.isHidden = true
    }
    
    @IBAction func createMeme(_ sender: Any) {
        randomMemePresenterObject?.onCreateButtonPressed()
    }
    
    @IBAction func setTextOnImage(_ sender: Any) {
        let s = memeTextField.text!
        let s2 = NSAttributedString(string: s, attributes:
                    [.font:UIFont(name: "Georgia", size: 50)!,
                     .foregroundColor: UIColor.yellow])
        let sz = randomMemeImageView.image!.size
        let r = UIGraphicsImageRenderer(size:sz)
        randomMemeImageView.image = r.image {
                    _ in
            randomMemeImageView.image!.draw(at:.zero)
            s2.draw(at: CGPoint(x:30, y:sz.height-150))
        }
    }
    
    @IBAction func revertText(_ sender: Any) {
        if let url = URL(string: url!) {
            DispatchQueue.main.async {
                self.randomMemeImageView.kf.setImage(with: url)
            }
        }
    }
    
    func config() {
        url = urls.randomElement()!
        text = texts.randomElement()!
        
        if let url = URL(string: url!) {
            DispatchQueue.main.async {
                self.randomMemeImageView.kf.setImage(with: url)
            }
        }
        randomTextLabel.text = text
        memeTextField.text = text
    }
}

extension RandomMemeViewController: PresenterToViewRandomMemeProcotol {
    func updateView(with memes: [Meme]) {
        for meme in memes {
            if let url = meme.url {
                urls.append(url)
            }
            if let text = meme.name {
                texts.append(text)
            }
        }
        config()
    }
}
