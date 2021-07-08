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
    
    var lotteyBox:[String] = []
    
    @IBOutlet weak var lotteryButton: UIButton!
    @IBOutlet weak var operationGuidanceLable: UILabel!
    @IBOutlet weak var bonusBoxLable: UILabel!
    @IBOutlet weak var bonusBoxSelectingButton: UIButton!
    @IBOutlet weak var penaltyBoxLable: UILabel!
    @IBOutlet weak var penaltyBoxSelectingButton: UIButton!
    
    @IBAction func tappedLotteryButton(_ sender: Any) {
        
        let lotteryViewController = UIStoryboard(name: "LotteryView", bundle: nil).instantiateViewController(withIdentifier: "LotteryView") as! LotteryViewController
        
        lotteryAction(lotteryViewController: lotteryViewController)
        transitionAnimation(lotteryViewController: lotteryViewController)
        present(lotteryViewController, animated: true, completion: nil)
    }
    
    func lotteryAction(lotteryViewController: LotteryViewController) {
        lotteyBox.removeAll()

        if tappedBonusBoxButtonToggle && tappedpenaltyBoxButtonToggle {
            addBonusContentToLotteyBox()
            addPenaltyContentToLotteyBox()
            randomValue(lotteryViewController: lotteryViewController)
            
        } else if tappedBonusBoxButtonToggle == true && tappedpenaltyBoxButtonToggle == false {
            addBonusContentToLotteyBox()
            randomValue(lotteryViewController: lotteryViewController)
                        
        } else if tappedBonusBoxButtonToggle == false && tappedpenaltyBoxButtonToggle == true{
            addPenaltyContentToLotteyBox()
            randomValue(lotteryViewController: lotteryViewController)
            
        } else {
            
        }

    }
    
    func addBonusContentToLotteyBox() {
        let bonusContentsView = UIStoryboard(name: "BonusContentsView", bundle: nil).instantiateViewController(withIdentifier: "BonusContentsView") as! BonusContentsViewController
        lotteyBox.append(contentsOf: bonusContentsView.contents)
    }
    func addPenaltyContentToLotteyBox() {
        let penaltyContentsView = UIStoryboard(name: "PenaltyContentsView", bundle: nil).instantiateViewController(withIdentifier: "PenaltyContentsView") as! PenaltyContentsViewController
        lotteyBox.append(contentsOf: penaltyContentsView.contents)
    }
    
    func randomValue(lotteryViewController: LotteryViewController) {
        guard let lotteyResult = lotteyBox.randomElement() else { return }
        lotteryViewController.resultText = lotteyResult
    }
    func transitionAnimation(lotteryViewController: LotteryViewController) {
        lotteryViewController.transitioningDelegate = self
        lotteryViewController.modalPresentationStyle = .custom
        lotteryViewController.modalPresentationCapturesStatusBarAppearance = true
        lotteryViewController.interactiveTransition = interactiveTransition
        interactiveTransition.attach(to: lotteryViewController)
    }
    
    @IBAction func tappedBonusBoxButton(_ sender: Any) {
        tappedBonusBoxButtonToggle = tappedButtonEffect(toggle: tappedBonusBoxButtonToggle, button: bonusBoxSelectingButton)
    }
    @IBAction func tappedPenaltyBoxButton(_ sender: Any) {
        tappedpenaltyBoxButtonToggle = tappedButtonEffect(toggle: tappedpenaltyBoxButtonToggle, button: penaltyBoxSelectingButton)
    }
    
    func tappedButtonEffect(toggle: Bool, button: UIButton) -> Bool {
        if toggle {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
                button.alpha = 0.4
              }
            return false
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
                button.alpha = 1
              }
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton(button: bonusBoxSelectingButton)
        setUpButton(button: penaltyBoxSelectingButton)
    }
    
    func setUpButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 3
        button.layer.shadowColor = UIColor.systemGray4.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
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
