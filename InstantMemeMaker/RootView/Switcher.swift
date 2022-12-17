//
//  Switcher.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 17.12.2022.
//

import UIKit

class Switcher {
    static func updateRootVC(){
        let status = UserDefaults.standard.string(forKey: "status")

        if let sceneDeleagate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                let window = sceneDeleagate.window {
            if status == "true" {
                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! UIViewController
                window.rootViewController = rootVC
            } else if status == "false"{
                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
                window.rootViewController = rootVC
            }
//            else {
//                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Onboarding")
//                window.rootViewController = rootVC
//            }
        }
    }
}
