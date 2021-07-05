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

    var contents = ["A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        penaltyContentsTableView.dataSource = self
        penaltyContentsTableView.delegate = self
        
        penaltyContentsTableView.allowsMultipleSelectionDuringEditing = true

    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Penalty")
    }
}
extension PenaltyContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = penaltyContentsTableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
}
