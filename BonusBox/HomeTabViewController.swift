//
//  HomeTabViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit

class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTab()
    }
    
    func setUpTab() {
        
        var viewControllers: [UIViewController] = []
        
        let boxViewController = BoxViewController()
        boxViewController.tabBarItem = UITabBarItem(title: "Box",
                                                    image: UIImage(systemName: "shippingbox"),
                                                    selectedImage: UIImage(systemName: "shippingbox.fill"))
        
        let layuot = UICollectionViewFlowLayout()
        let contentsViewController = ContentsViewController(collectionViewLayout: layuot)
        contentsViewController.tabBarItem = UITabBarItem(title: "Contents",
                                                    image: UIImage(systemName: "rectangle.on.rectangle"),
                                                    selectedImage: UIImage(systemName: "rectangle.fill.on.rectangle.fill"))
        
        viewControllers.append(boxViewController)
        viewControllers.append(contentsViewController)
        
        self.setViewControllers(viewControllers, animated: false)

    }
}
