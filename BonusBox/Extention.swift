//
//  Extention.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/08.
//

import Foundation
import UIKit

public func setUpButton(button: UIButton) {
    button.layer.cornerRadius = 10
    button.layer.shadowOpacity = 0.7
    button.layer.shadowRadius = 3
    button.layer.shadowColor = UIColor.systemGray4.cgColor
    button.layer.shadowOffset = CGSize(width: 3, height: 3)
}
