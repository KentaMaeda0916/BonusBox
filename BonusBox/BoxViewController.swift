//
//  BoxViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class BoxViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let buttonStackView = UIStackView(arrangedSubviews: [bonusBoxButton,penaltyButton])
        buttonStackView.axis = .horizontal
        
        view.addSubview(operationGuidanceLable)
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            operationGuidanceLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            operationGuidanceLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        operationGuidanceLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    let operationGuidanceLable: UILabel = {
        let label = UILabel()
        label.text = "箱を選択してください"
        return label
    }()
    
    let bonusBoxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }()
    
    let penaltyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }()
    
    private func setupLayout() {
        
    }

}
