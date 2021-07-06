//
//  LotteryViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/01.
//

import UIKit
import BubbleTransition

class LotteryViewController: UIViewController {
    let transition = BubbleTransition()
    weak var interactiveTransition: BubbleInteractiveTransition?

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var resultTitleLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func tappedDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        interactiveTransition?.finish()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
}
