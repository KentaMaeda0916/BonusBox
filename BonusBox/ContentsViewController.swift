//
//  ContentsViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class ContentsViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "content"
        collectionView.backgroundColor = .blue
        
        collectionView.register(ContentsCell.self, forCellWithReuseIdentifier: "cellId")
//        setUpMenuBar()
    }
//
//    let menuBar: MenuBar = {
//        let menuBar = MenuBar()
//        return menuBar
//    }()
//
//    private func setUpMenuBar() {
//        view.addSubview(menuBr)
//        view.addCon
//    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)

        return cell
    }
}

extension ContentsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 0.8, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

class ContentsCell: UICollectionViewCell {
    
    let contentsTitle: UILabel = {
        let label = UILabel()
        label.text = "content1"
        label.tintColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setUpLayout()
    }
    
    private func setUpLayout() {
        addSubview(contentsTitle)
        
        NSLayoutConstraint.activate([
            contentsTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            contentsTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5)
        ])
        contentsTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
