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
    
    var contents = ["A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bonusContentsTableView.dataSource = self
        bonusContentsTableView.delegate = self
        
        bonusContentsTableView.allowsMultipleSelectionDuringEditing = true
        navigationItem.title = "内容"
        navigationItem.rightBarButtonItem = editButtonItem
        
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        bonusContentsTableView.isEditing = editing
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Bonus")
    }
}
extension BonusContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bonusContentsTableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
}
