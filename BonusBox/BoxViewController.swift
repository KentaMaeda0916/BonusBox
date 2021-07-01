//
//  BoxViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class BoxViewController: UIViewController {
    
    let operationGuidanceLable: UILabel = {
        let label = UILabel()
        label.text = "箱を選択してください"
        return label
    }()
    
    let bonusBoxLable: UILabel = {
        let label = UILabel()
        label.text = "ボーナス"
        return label
    }()
    
    let bonusBoxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    let bonusBoxSelectingButton: UIButton = {
        let button = UIButton()
        button.setTitle("選択中", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let penaltyBoxLable: UILabel = {
        let label = UILabel()
        label.text = "罰ゲーム"
        return label
    }()
    
    let penaltyBoxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    
    let penaltyBoxSelectingButton: UIButton = {
        let button = UIButton()
        button.setTitle("選択中", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("くじを引く", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let bonusBoxStackView = UIStackView(arrangedSubviews: [bonusBoxLable,bonusBoxButton,bonusBoxSelectingButton])
        bonusBoxStackView.axis = .vertical
        bonusBoxStackView.distribution = .fillEqually
        
        let penaltyBoxStackView = UIStackView(arrangedSubviews: [penaltyBoxLable,penaltyBoxButton,penaltyBoxSelectingButton])
        penaltyBoxStackView.axis = .vertical
        penaltyBoxStackView.distribution = .fillEqually
        
        let buttonStackView = UIStackView(arrangedSubviews: [bonusBoxStackView,penaltyBoxStackView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(operationGuidanceLable)
        view.addSubview(buttonStackView)
        view.addSubview(actionButton)

        NSLayoutConstraint.activate([
            operationGuidanceLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            operationGuidanceLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        operationGuidanceLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: operationGuidanceLable.bottomAnchor, constant: 40),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buttonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 40),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
    }

    private func setupLayout() {
        
    }

}
