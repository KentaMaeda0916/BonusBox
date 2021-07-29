//
//  lotteryBox.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum BoxType: String {
    case bonus = "bonus"
    case penalty = "penalty"
}

enum LotteryError: Error {
    case noSelected
    case noContentsInBonusBox
    case noContentsInPenaltyBox
}

protocol BoxSelected {
    func selectedState(bonusBox: Bool, penaltyBox: Bool) -> Observable<Void>
    func lotteryAction(bonusContentsEntity: Bool, penaltyContentsEntity: Bool) -> Observable<Void>
}

class BoxSelect: BoxSelected {
    func selectedState(bonusBox: Bool, penaltyBox: Bool) -> Observable<Void> {
        switch (bonusBox, penaltyBox) {
        case (false, false): return Observable.error(LotteryError.noSelected)
        default: return Observable.just(())
        }
    }
    func lotteryAction(bonusContentsEntity: Bool, penaltyContentsEntity: Bool) -> Observable<Void> {
        switch  (bonusContentsEntity, penaltyContentsEntity) {
        case (true, true): return Observable.just(())
        case (false, true): return Observable.error(LotteryError.noContentsInBonusBox)
        case (true, false): return Observable.error(LotteryError.noContentsInPenaltyBox)
        case (false, false): return Observable.just(())
        }
    }
    
}
