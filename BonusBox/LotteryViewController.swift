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
        setUpLayout()
    }
    
    private func setUpLayout() {
        view.backgroundColor  = .orange
        let tabBarHeight = self.tabBarHeight(tabBarController: HomeTabViewController())
        let dismissButtonConstant = tabBarHeight + lotteryButtonConstant
        let resultStackView = UIStackView(arrangedSubviews: [resultTitleLable,resultLable])
        resultStackView.axis = .vertical
        resultStackView.distribution = .fillEqually
        resultStackView.alignment = .center
        
        view.addSubview(dismissButton)
        view.addSubview(resultStackView)
        
        
        NSLayoutConstraint.activate([
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(dismissButtonConstant)),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            resultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        resultStackView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    
    
    func tabBarHeight(tabBarController: UITabBarController) -> CGFloat {
        return tabBarController.tabBar.frame.size.height
    }
}
