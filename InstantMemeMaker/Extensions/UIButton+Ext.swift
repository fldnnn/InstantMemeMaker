//
//  UIButton+Ext.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 17.12.2022.
//

import UIKit

extension UIButton {
    func cornerButton() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
