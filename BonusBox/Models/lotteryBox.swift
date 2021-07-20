//
//  lotteryBox.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/20.
//

import Foundation

enum BoxType: String {
    case bonus = "bonus"
    case penalty = "penalty"
}

enum LotteryErrorMassage: String {
    case noSelected = "箱が選択されていません"
    case noContentsInBonusBox = "「ボーナス」箱の中身がありません"
    case noContentsInPenaltyBox = "「バツゲーム」箱の中身がありません"
}
