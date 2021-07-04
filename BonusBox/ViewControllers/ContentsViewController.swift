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
        
    }

//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//
//        return cell
//    }
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
//extension ContentsViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width * 0.8, height: 50)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//}

//class ContentsCell: UICollectionViewCell {
//
//    let contentsTitle: UILabel = {
//        let label = UILabel()
//        label.text = "content1"
//        label.tintColor = .black
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        backgroundColor = .white
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
