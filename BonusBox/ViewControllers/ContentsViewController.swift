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
        setUpPagerTab()
        super.viewDidLoad()
        setUpButton(button: contentsAddButton)
        navigationItem.title = "はこの中身"
        navigationItem.rightBarButtonItem = editButtonItem
        
    }
    
    func setUpPagerTab() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .systemGray6
        settings.style.buttonBarItemBackgroundColor = .systemGray6
        settings.style.buttonBarItemTitleColor = .black
        settings.style.selectedBarBackgroundColor = .systemGreen
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarMinimumInteritemSpacing = 0
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

