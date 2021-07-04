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
    

    @IBOutlet weak var operationGuidanceLable: UILabel!
    @IBOutlet weak var bonusBoxLable: UILabel!
    @IBOutlet weak var bonusBoxSelectingButton: UIButton!
    @IBOutlet weak var penaltyBoxLable: UILabel!
    @IBOutlet weak var penaltyBoxSelectingButton: UIButton!

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
//    @objc func tappedPenaltyBoxButton(_ sender: UIButton) {
//        if tappedpenaltyBoxButtonToggle {
//            tappedpenaltyBoxButtonToggle = false
//            penaltyBoxSelectingButton.setImage(UIImage(systemName: "archivebox"), for: .normal)
//        } else {
//            tappedpenaltyBoxButtonToggle = true
//            penaltyBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
//    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .present
//        transition.startingPoint = LotteryButton.center
//        transition.bubbleColor = LotteryButton.backgroundColor!
//        return transition
//    }
//
//    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .dismiss
//        transition.startingPoint = LotteryButton.center
//        transition.bubbleColor = LotteryButton.backgroundColor!
//        return transition
//    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}
