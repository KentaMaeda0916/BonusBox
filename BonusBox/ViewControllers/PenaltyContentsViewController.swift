//
//  PenaltyContentsViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/07/05.
//

import UIKit
import XLPagerTabStrip

class PenaltyContentsViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var penaltyContentsTableView: UITableView!

    var userDefault = UserDefaults.standard
    var contents:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let penaltyContents = userDefault.stringArray(forKey: "penalty") else { return }
        contents.append(contentsOf: penaltyContents)
        
        penaltyContentsTableView.dataSource = self
        penaltyContentsTableView.delegate = self
        
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "バツゲーム")
    }
}
extension PenaltyContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = penaltyContentsTableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contents.remove(at: indexPath.row)
        penaltyContentsTableView.deleteRows(at: [indexPath], with: .automatic)
        userDefault.setValue(contents, forKey: "penalty")
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if penaltyContentsTableView.isEditing {
            return .delete
        }
        return .none
    }
}
