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
    
    var resultText = ""
    var lotteryButtonY: CGFloat = 0
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var resultTitleLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var dismissButtonY: NSLayoutConstraint!
    
    @IBAction func tappedDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        interactiveTransition?.finish()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dismissButtonY.constant = lotteryButtonY
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        resultLable.text = resultText
        setupDismissButtonButton()
    }
    
    func setupDismissButtonButton() {
        dismissButton.layer.cornerRadius = 50
    }
}
