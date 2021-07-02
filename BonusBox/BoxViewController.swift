//
//  BoxViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit
import BubbleTransition

class BoxViewController: UIViewController, UIViewControllerTransitioningDelegate {
    let transition = BubbleTransition()
    let interactiveTransition = BubbleInteractiveTransition()
    
    let lotteryButtonConstant: CGFloat = 80
    
    var bubbleColor: UIColor = .white
    var startingPoint = CGPoint.zero
    var duration = 0.5
    var tappedBonusBoxButtonToggle: Bool = true
    var tappedpenaltyBoxButtonToggle: Bool = true
    

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
    
    let bonusBoxSelectingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(tappedBonusBoxButton(_:)), for: .touchUpInside)
        return button
    }()

    let penaltyBoxLable: UILabel = {
        let label = UILabel()
        label.text = "罰ゲーム"
        return label
    }()
    
    let penaltyBoxSelectingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(tappedPenaltyBoxButton(_:)), for: .touchUpInside)
        return button
    }()
    
    let LotteryButton: UIButton = {
        let button = UIButton()
        button.setTitle("くじを引く", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(tappedLotteryButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLotteryButton(_ sender: UIButton) {
        let modalViewController = LotteryViewController()
        modalViewController.transitioningDelegate = self
        modalViewController.modalPresentationStyle = .custom
        modalViewController.modalPresentationCapturesStatusBarAppearance = true
        modalViewController.interactiveTransition = interactiveTransition
        modalViewController.lotteryButtonConstant = lotteryButtonConstant
        
        if tappedBonusBoxButtonToggle && tappedpenaltyBoxButtonToggle {
            modalViewController.resultLable.text = "ボーナス＋バツ"
        } else if tappedBonusBoxButtonToggle == true && tappedpenaltyBoxButtonToggle == false {
            modalViewController.resultLable.text = "ボーナス"
        } else if tappedBonusBoxButtonToggle == false && tappedpenaltyBoxButtonToggle == true{
            modalViewController.resultLable.text = "バツ"
        } else {
            
        }
        
        present(modalViewController, animated: true, completion: nil)
    }
    
    @objc func tappedBonusBoxButton(_ sender: UIButton) {
        if tappedBonusBoxButtonToggle {
            tappedBonusBoxButtonToggle = false
            bonusBoxSelectingButton.setImage(UIImage(systemName: "archivebox"), for: .normal)
        } else {
            tappedBonusBoxButtonToggle = true
            bonusBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        }
    }
    @objc func tappedPenaltyBoxButton(_ sender: UIButton) {
        if tappedpenaltyBoxButtonToggle {
            tappedpenaltyBoxButtonToggle = false
            penaltyBoxSelectingButton.setImage(UIImage(systemName: "archivebox"), for: .normal)
        } else {
            tappedpenaltyBoxButtonToggle = true
            penaltyBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        
    }
    
    func setUpLayout() {
        view.backgroundColor = .white
        
        let bonusBoxStackView = UIStackView(arrangedSubviews: [bonusBoxLable,bonusBoxSelectingButton])
        bonusBoxStackView.axis = .vertical
        bonusBoxStackView.distribution = .fillEqually
        
        let penaltyBoxStackView = UIStackView(arrangedSubviews: [penaltyBoxLable,penaltyBoxSelectingButton])
        penaltyBoxStackView.axis = .vertical
        penaltyBoxStackView.distribution = .fillEqually
        
        let buttonStackView = UIStackView(arrangedSubviews: [bonusBoxStackView,penaltyBoxStackView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(operationGuidanceLable)
        view.addSubview(buttonStackView)
        view.addSubview(LotteryButton)
        
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
            LotteryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(lotteryButtonConstant)),
            LotteryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        LotteryButton.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = LotteryButton.center
        transition.bubbleColor = LotteryButton.backgroundColor!
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = LotteryButton.center
        transition.bubbleColor = LotteryButton.backgroundColor!
        return transition
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}
