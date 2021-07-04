//
//  LotteryViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/01.
//

import UIKit
import BubbleTransition

class LotteryViewController: UIViewController {

    weak var interactiveTransition: BubbleInteractiveTransition?
    var lotteryButtonConstant: CGFloat = 0
    
    let resultTitleLable: UILabel = {
        let label = UILabel()
        label.text = "くじ結果"
        return label
    }()
    
    let resultLable: UILabel = {
        let label = UILabel()
        label.text = "結果"
        return label
    }()
    
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("閉じる", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(dismissButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        interactiveTransition?.finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tabBarHeight(tabBarController: UITabBarController) -> CGFloat {
        return tabBarController.tabBar.frame.size.height
    }
}
