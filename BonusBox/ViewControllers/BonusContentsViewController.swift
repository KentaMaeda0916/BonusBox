//
//  BonusContentsViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/05.
//

import UIKit
import XLPagerTabStrip

class BonusContentsViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var bonusContentsTableView: UITableView!
    
    var userDefault = UserDefaults.standard
    var contents:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let bonusContents = userDefault.stringArray(forKey: "bonus") else { return }
        contents.append(contentsOf: bonusContents)
        
        bonusContentsTableView.dataSource = self
        bonusContentsTableView.delegate = self
        
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ボーナス")
    }
}
extension BonusContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bonusContentsTableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contents.remove(at: indexPath.row)
        bonusContentsTableView.deleteRows(at: [indexPath], with: .automatic)
        userDefault.setValue(contents, forKey: "bonus")
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if bonusContentsTableView.isEditing {
            return .delete
        }
        return .none
    }
}
