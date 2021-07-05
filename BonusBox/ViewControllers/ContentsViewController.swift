//
//  ParentViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit
import XLPagerTabStrip

class ContentsViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .black
////        settings.style.selectedBarBackgroundColor = .purple
//        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
//        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0

        settings.style.buttonBarItemsShouldFillAvailableWidth = true
//        settings.style.buttonBarLeftContentInset = 50
//        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarMinimumInteritemSpacing = 0
        
        super.viewDidLoad()

    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewControllerを返す処理
        let firstVC = UIStoryboard(name: "BonusContentsView", bundle: nil).instantiateViewController(withIdentifier: "BonusContentsView")
        let secondVC = UIStoryboard(name: "PenaltyContentsView", bundle: nil).instantiateViewController(withIdentifier: "PenaltyContentsView")
        let childViewControllers:[UIViewController] = [firstVC, secondVC]
        return childViewControllers
    }
}

