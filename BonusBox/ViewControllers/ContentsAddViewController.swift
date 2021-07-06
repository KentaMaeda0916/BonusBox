//
//  ContentsAddViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/06.
//

import UIKit

class ContentsAddViewController: UIViewController {

    @IBOutlet weak var contentsType: UISegmentedControl!
    @IBOutlet weak var newContentsTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let bonusContentsView = UIStoryboard(name: "BonusContentsView", bundle: nil).instantiateViewController(withIdentifier: "BonusContentsView") as! BonusContentsViewController
    let penaltyContentsView = UIStoryboard(name: "PenaltyContentsView", bundle: nil).instantiateViewController(withIdentifier: "PenaltyContentsView") as! PenaltyContentsViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newContentsTextField.text = ""
    }
    @IBAction func tappedAddButton(_ sender: Any) {
        guard let newcontent = newContentsTextField.text else { return }
        
        if contentsType.selectedSegmentIndex == 0 {
            bonusContentsView.contents.append(newcontent)
            dismiss(animated: true, completion: nil)
            
        } else if contentsType.selectedSegmentIndex == 1 {
            penaltyContentsView.contents.append(newcontent)
            dismiss(animated: true, completion: nil)

        } else { return }

    }
    
}
