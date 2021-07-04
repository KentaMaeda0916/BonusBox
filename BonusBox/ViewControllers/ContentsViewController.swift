//
//  ContentsViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class ContentsViewController: UIViewController {

    @IBOutlet weak var contentsTableVIew: UITableView!
    
    var contents = ["A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsTableVIew.dataSource = self
        contentsTableVIew.delegate = self
        
        contentsTableVIew.allowsMultipleSelectionDuringEditing = true
        navigationItem.title = "内容"
        navigationItem.rightBarButtonItem = editButtonItem
        
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        contentsTableVIew.isEditing = editing
    }
}

extension ContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentsTableVIew.dequeueReusableCell(withIdentifier: "contentsCell", for: indexPath)
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }

}
