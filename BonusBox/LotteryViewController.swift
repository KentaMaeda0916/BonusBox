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
        setUpLayout()
    }
    
    private func setUpLayout() {
        view.backgroundColor  = .orange
        let tabBarHeight = self.tabBarHeight(tabBarController: HomeTabViewController())
        let dismissButtonConstant = tabBarHeight + lotteryButtonConstant
        
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(dismissButtonConstant)),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func tabBarHeight(tabBarController: UITabBarController) -> CGFloat {
        return tabBarController.tabBar.frame.size.height
    }
}
