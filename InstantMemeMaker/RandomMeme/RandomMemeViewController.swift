//
//  RandomMemeViewController.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import UIKit
import Kingfisher
import MessageUI
import FirebaseAuth

class RandomMemeViewController: UIViewController {
    
    @IBOutlet weak var randomMemeImageView: UIImageView!
    @IBOutlet weak var memeTextField: UITextField!
    @IBOutlet weak var logOutOutlet: UIButton!
    
    var randomMemePresenterObject: ViewToPresenterRandomMemeProcotol?
    var urls = [String]()
    var texts = [String]()
    var url: String?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RandomMemeRouter.createModule(ref: self)
        logOutOutlet.cornerButton()
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
        let r = UIGraphicsImageRenderer(size: sz)
        randomMemeImageView.image = r.image {
                    _ in
            randomMemeImageView.image!.draw(at: .zero)
            s2.draw(at: CGPoint(x: 30, y: sz.height-150))
        }
    }
    
    @IBAction func revertText(_ sender: Any) {
        if let url = URL(string: url!) {
            DispatchQueue.main.async {
                self.randomMemeImageView.kf.setImage(with: url)
            }
        }
    }
    
    @IBAction func onShareButtonPressed(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [randomMemeImageView.image!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func onLogoutButtonPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.set(false, forKey: "status")
            Switcher.updateRootVC()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
        let viewController = storyboard?.instantiateViewController(identifier: "LoginVC")
        viewController!.modalPresentationStyle = .fullScreen
        viewController!.modalTransitionStyle = .flipHorizontal
        present(viewController!, animated: true, completion: nil)
    }
    
    private func config() {
        url = urls.randomElement()!
        text = texts.randomElement()!
        
        if let url = URL(string: url!) {
            DispatchQueue.main.async {
                self.randomMemeImageView.kf.setImage(with: url)
            }
        }
        memeTextField.text = text
    }
    //let imageData = randomMemeImageView.image?.pngData()
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
