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
    func selectedState(bonusBoxSelected: Bool, penaltyBoxSelected: Bool) -> Observable<Void>
}

class BoxSelect: BoxSelected {
    func selectedState(bonusBoxSelected: Bool, penaltyBoxSelected: Bool) -> Observable<Void> {
        switch (bonusBoxSelected, penaltyBoxSelected) {
        case (false, false): return Observable.error(LotteryError.noSelected)
        default: return Observable.just(())
        }
    }
    
}
