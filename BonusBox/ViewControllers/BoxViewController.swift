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
    

//    var bubbleColor: UIColor = .white
//    var startingPoint = CGPoint.zero
//    var duration = 0.5
    
    var tappedBonusBoxButtonToggle: Bool = true
    var tappedpenaltyBoxButtonToggle: Bool = true
    
    @IBOutlet weak var lotteryButton: UIButton!
    @IBOutlet weak var operationGuidanceLable: UILabel!
    @IBOutlet weak var bonusBoxLable: UILabel!
    @IBOutlet weak var bonusBoxSelectingButton: UIButton!
    @IBOutlet weak var penaltyBoxLable: UILabel!
    @IBOutlet weak var penaltyBoxSelectingButton: UIButton!

    @IBAction func tappedLotteryButton(_ sender: Any) {
        let modalViewController = UIStoryboard(name: "LotteryView", bundle: nil).instantiateViewController(withIdentifier: "LotteryView") as! LotteryViewController
        if tappedBonusBoxButtonToggle && tappedpenaltyBoxButtonToggle {
            modalViewController.resultText = "ボーナス＋バツ"
        } else if tappedBonusBoxButtonToggle == true && tappedpenaltyBoxButtonToggle == false {
            modalViewController.resultText = "ボーナス"
        } else if tappedBonusBoxButtonToggle == false && tappedpenaltyBoxButtonToggle == true{
            modalViewController.resultText = "バツ"
        } else {
            
        }
        modalViewController.transitioningDelegate = self
        modalViewController.modalPresentationStyle = .custom
        modalViewController.modalPresentationCapturesStatusBarAppearance = true
        modalViewController.interactiveTransition = interactiveTransition
        interactiveTransition.attach(to: modalViewController)
        present(modalViewController, animated: true, completion: nil)
    }

    @IBAction func tappedBonusBoxButton(_ sender: Any) {
        if tappedBonusBoxButtonToggle {
            tappedBonusBoxButtonToggle = false
            bonusBoxSelectingButton.setImage(UIImage(systemName: "archivebox"), for: .normal)
        } else {
            tappedBonusBoxButtonToggle = true
            bonusBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        }
    }
    @IBAction func tappedPenaltyBoxButton(_ sender: Any) {
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

        bonusBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
        penaltyBoxSelectingButton.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = lotteryButton.center
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = lotteryButton.center
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}
