//
//  LotteryViewModel.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/26.
//

import Foundation
import UIKit

class LotteryViewModel {
    
}

extension LotteryError {
    var LotteryErrorText: String {
        switch self {
        case .noSelected: return "箱が選択されていません"
        case .noContentsInBonusBox: return "「ボーナス」箱の中身がありません"
        case .noContentsInPenaltyBox: return "「バツゲーム」箱の中身がありません"
        }
    }
}

