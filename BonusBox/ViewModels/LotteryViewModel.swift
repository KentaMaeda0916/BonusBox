//
//  LotteryViewModel.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/26.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LotteryViewModel {
    
    let operationGuidanceText: Observable<String>
    let operationGuidanceColor: Observable<UIColor>
    let lotteryButtonIsEnable: Observable<Bool>
    let buttonAlpha: Observable<CGFloat>
    
    var userDefault = UserDefaults.standard
    var lotteyBox:[String] = []
    
    init(bonusBoxSelected: Observable<Bool>,
         penaltyBoxSelected: Observable<Bool>,
         model: BoxSelected)
    {
        let event = Observable
            .combineLatest(bonusBoxSelected, penaltyBoxSelected)
            .flatMap { bonusBox,penaltyBox -> Observable<Event<Void>> in
                return model
                    .selectedState(bonusBox: bonusBox, penaltyBox: penaltyBox)
                    .materialize()
            }.share()
        
        self.operationGuidanceText = event
            .flatMap{ event -> Observable<String> in
                switch event {
                case .next: return .just("")
                case let .error(error as LotteryError): return .just(error.LotteryErrorText)
                case .error, .completed: return .empty()
                }
            }.startWith("箱を選択してください")
        
        self.operationGuidanceColor = event
            .flatMap{ event -> Observable<UIColor> in
                switch event {
                case .next: return .just(.black)
                case .error: return .just(.red)
                case .completed: return .empty()
                }
            }
        
        self.lotteryButtonIsEnable = event
            .flatMap{ event -> Observable<Bool> in
                switch event {
                case .next: return .just(true)
                case .error: return .just(false)
                case .completed: return .empty()
                }
            }
        self.buttonAlpha = event
            .flatMap{ event -> Observable<CGFloat> in
                switch event {
                case .next: return .just(1)
                case let .error(error as LotteryError): return .just(error.ButtonAlpha)
                case .error, .completed: return .empty()
                }
            }
    }
    
    
    //    func lotteryAction(lotteryViewController: LotteryViewController) {
    //        lotteyBox.removeAll()
//
//        if tappedBonusBoxButtonToggle && tappedpenaltyBoxButtonToggle {
//            addBonusContentToLotteyBox(type: BoxType.bonus)
//            addPenaltyContentToLotteyBox(type: BoxType.penalty)
//            randomValue(lotteryViewController: lotteryViewController)
//
//        } else if tappedBonusBoxButtonToggle == true && tappedpenaltyBoxButtonToggle == false {
//            addBonusContentToLotteyBox(type: BoxType.bonus)
//            randomValue(lotteryViewController: lotteryViewController)
//
//        } else if tappedBonusBoxButtonToggle == false && tappedpenaltyBoxButtonToggle == true{
//            addPenaltyContentToLotteyBox(type: BoxType.penalty)
//            randomValue(lotteryViewController: lotteryViewController)
//
//        } else {
//
//        }
//
//    }
//
//    func addBonusContentToLotteyBox(type: BoxType) {
//        if userDefault.stringArray(forKey: type.rawValue)?.count != 0 {
//            guard let bonusContents = userDefault.stringArray(forKey: type.rawValue) else { return }
//            lotteyBox.append(contentsOf: bonusContents)
//        } else {
////            alert(text: LotteryErrorMassage.noContentsInBonusBox.rawValue)
//        }
//    }
//    func addPenaltyContentToLotteyBox(type: BoxType) {
//        if userDefault.stringArray(forKey: type.rawValue)?.count != 0 {
//            guard let penaltyContents = userDefault.stringArray(forKey: type.rawValue) else { return }
//            lotteyBox.append(contentsOf: penaltyContents)
//        } else {
////            alert(text: LotteryErrorMassage.noContentsInPenaltyBox.rawValue)
//        }
//    }
//
    func randomValue(lotteryViewController: LotteryViewController) {
        guard let lotteyResult = lotteyBox.randomElement() else { return }
        lotteryViewController.resultText = lotteyResult
    }
}

extension LotteryError {
    var LotteryErrorText: String {
        switch self {
        case .noSelected: return "箱が選択されていません"
        case .noContentsInBonusBox: return "「ボーナス」箱の中身がありません"
        case .noContentsInPenaltyBox: return "「バツゲーム」箱の中身がありません"
        }
    }
    var ButtonAlpha: CGFloat{
        switch self {
        case .noSelected: return 0.4
        case .noContentsInBonusBox: return 1
        case .noContentsInPenaltyBox: return 1
        }
    }
    
}

extension BoxViewController: UIViewControllerTransitioningDelegate {
    
    func setCenterPoint() -> CGPoint{
        let lotteryButtonConvertCGPoint = lotteryButton.convert(CGPoint.zero, to: view)
        let centerX = lotteryButtonConvertCGPoint.x + lotteryButton.frame.width/2
        let centerY = lotteryButtonConvertCGPoint.y + lotteryButton.frame.height/2
        let centerPoint: CGPoint = CGPoint(x: centerX, y: centerY)
        return centerPoint
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = setCenterPoint()
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = setCenterPoint()
        transition.bubbleColor = lotteryButton.backgroundColor!
        return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}
