//
//  HomeTabViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefaults = UserDefaults.standard
        let firstLunchKey = "firstLunchKey"
        let demoBonusContents: [String] = ["アニメ１本見る","デザートを食べる","夜お酒を飲む"]
        let demoPenaltyContents: [String] = ["スクワット１０回"]
        
        if userDefaults.bool(forKey: firstLunchKey) {
            userDefaults.setValue(demoBonusContents, forKey: "bonus")
            userDefaults.setValue(demoPenaltyContents, forKey: "penalty")
        }
    }
}
