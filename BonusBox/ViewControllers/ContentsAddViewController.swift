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
    
    var userDefault = UserDefaults.standard
    var getContentArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextFieldButton()
        setUpButton(button: addButton)
        newContentsTextField.text = ""
        
    }
    @IBAction func tappedAddButton(_ sender: Any) {
        guard let newcontent = newContentsTextField.text else { return }
        
        if contentsType.selectedSegmentIndex == 0 {
            getContentArray.removeAll()
            if let contents = userDefault.stringArray(forKey: "bonus") {
                getContentArray.append(contentsOf: contents)
            }
            getContentArray.append(newcontent)
            userDefault.set(getContentArray, forKey: "bonus")
            bonusContentsView.bonusContentsTableView?.reloadData()
            dismiss(animated: true, completion: nil)
            
        } else if contentsType.selectedSegmentIndex == 1 {
            getContentArray.removeAll()
            if let contents = userDefault.stringArray(forKey: "penalty") {
                getContentArray.append(contentsOf: contents)
            }
            getContentArray.append(newcontent)
            userDefault.set(getContentArray, forKey: "penalty")
            penaltyContentsView.penaltyContentsTableView?.reloadData()
            dismiss(animated: true, completion: nil)

        } else { return }

    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func textEditingDidChanged(_ sender: Any) {
        updateTextFieldButton()
    }
    
    private func updateTextFieldButton() {
        if newContentsTextField.text == "" {
            addButton.isEnabled = false
            addButton.layer.opacity = 0.4
        } else {
            addButton.isEnabled = true
            addButton.layer.opacity = 1
        }
    }
}
