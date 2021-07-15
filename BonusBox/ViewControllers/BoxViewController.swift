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
    var userDefault = UserDefaults.standard

    var lotteyBox:[String] = []
    
    @IBOutlet weak var lotteryButton: UIButton!
    @IBOutlet weak var operationGuidanceLable: UILabel!
    @IBOutlet weak var bonusBoxLable: UILabel!
    @IBOutlet weak var bonusBoxSelectingButton: UIButton!
    @IBOutlet weak var penaltyBoxLable: UILabel!
    @IBOutlet weak var penaltyBoxSelectingButton: UIButton!
    
    @IBAction func tappedLotteryButton(_ sender: Any) {
        
        if tappedBonusBoxButtonToggle == false && tappedpenaltyBoxButtonToggle == false {
            alert(text: "箱が選択されていません")
        } else {
            let lotteryViewController = UIStoryboard(name: "LotteryView", bundle: nil).instantiateViewController(withIdentifier: "LotteryView") as! LotteryViewController
            
            let lotteryButtonConvertCGPoint = lotteryButton.convert(CGPoint.zero, to: view)
            let lotteryButtonCGPointY = lotteryButtonConvertCGPoint.y
            lotteryViewController.lotteryButtonY = lotteryButtonCGPointY
            
            lotteryAction(lotteryViewController: lotteryViewController)
            transitionAnimation(lotteryViewController: lotteryViewController)
            present(lotteryViewController, animated: true, completion: nil)
        }
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
        if userDefault.stringArray(forKey: "bonus")?.count != 0 {
            guard let bonusContents = userDefault.stringArray(forKey: "bonus") else { return }
            lotteyBox.append(contentsOf: bonusContents)
        } else {
            alert(text: "「ボーナス」箱の中身がありません")
        }
    }
    func addPenaltyContentToLotteyBox() {
        if userDefault.stringArray(forKey: "penalty")?.count != 0 {
            guard let penaltyContents = userDefault.stringArray(forKey: "penalty") else { return }
            lotteyBox.append(contentsOf: penaltyContents)
        } else {
            alert(text: "「バツゲーム」箱の中身がありません")
        }
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
        setupLotteyButton()
        setUpButton(button: bonusBoxSelectingButton)
        setUpButton(button: penaltyBoxSelectingButton)
    }
    
    func setupLotteyButton() {
        lotteryButton.layer.cornerRadius = 50
        lotteryButton.layer.shadowOpacity = 0.7
        lotteryButton.layer.shadowRadius = 3
        lotteryButton.layer.shadowColor = UIColor.systemGray4.cgColor
        lotteryButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        lotteryButton.imageView?.contentMode = .scaleAspectFit
        lotteryButton.contentHorizontalAlignment = .fill
        lotteryButton.contentVerticalAlignment = .fill
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        let lotteryButtonConvertCGPoint = lotteryButton.convert(CGPoint.zero, to: view)
        let centerX = lotteryButtonConvertCGPoint.x + lotteryButton.frame.width/2
        let centerY = lotteryButtonConvertCGPoint.y + lotteryButton.frame.height/2
        let centerPoint: CGPoint = CGPoint(x: centerX, y: centerY)
        transition.startingPoint = centerPoint
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        let lotteryButtonConvertCGPoint = lotteryButton.convert(CGPoint.zero, to: view)
        let centerX = lotteryButtonConvertCGPoint.x + lotteryButton.frame.width/2
        let centerY = lotteryButtonConvertCGPoint.y + lotteryButton.frame.height/2
        let centerPoint: CGPoint = CGPoint(x: centerX, y: centerY)
        transition.startingPoint = centerPoint
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
    private func alert(text: String) {
        let alert: UIAlertController = UIAlertController(title: "エラー", message: text,
                                                         preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
