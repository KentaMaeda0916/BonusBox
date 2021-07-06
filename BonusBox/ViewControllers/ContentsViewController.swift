//
//  ParentViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit
import XLPagerTabStrip

class ContentsViewController: ButtonBarPagerTabStripViewController {
    
    var bonusContentsView: BonusContentsViewController? {
        return children.first { $0 is BonusContentsViewController} as? BonusContentsViewController
    }
    var penaltyContentsView: PenaltyContentsViewController? {
        return children.first { $0 is PenaltyContentsViewController} as? PenaltyContentsViewController
    }
    @IBOutlet weak var contentsAddButton: UIButton!
    
    override func viewDidLoad() {
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarMinimumInteritemSpacing = 0
        
        super.viewDidLoad()
        navigationItem.title = "内容"
        navigationItem.rightBarButtonItem = editButtonItem

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        bonusContentsView?.bonusContentsTableView.setEditing(editing, animated: animated)
        penaltyContentsView?.penaltyContentsTableView.setEditing(editing, animated: animated)
        
        if editing {
            containerView.isScrollEnabled = false
        } else {
            containerView.isScrollEnabled = true
        }
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewControllerを返す処理
        let firstVC = UIStoryboard(name: "BonusContentsView", bundle: nil).instantiateViewController(withIdentifier: "BonusContentsView")
        let secondVC = UIStoryboard(name: "PenaltyContentsView", bundle: nil).instantiateViewController(withIdentifier: "PenaltyContentsView")
        let childViewControllers:[UIViewController] = [firstVC, secondVC]
        return childViewControllers
    }
}

