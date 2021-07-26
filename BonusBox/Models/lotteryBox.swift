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

enum LotteryError: Error {
    case noSelected
    case noContentsInBonusBox
    case noContentsInPenaltyBox
}
