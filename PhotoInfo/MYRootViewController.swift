//
//  MYRootViewController.swift
//  PhotoInfo
//
//  Created by Mika Yamamoto on 2014/06/27.
//  Copyright (c) 2014年 Mika Yamamoto. All rights reserved.
//

import UIKit

class MYRootViewController: UIViewController {
    
    var dateViewController:DateViewController?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
        
        self.dateViewController = DateViewController(nibName:nil, bundle:nil)
        
        var tabs = [self.dateViewController!]
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(tabs, animated: true)

        self.view!.addSubview(tabBarController.view)
        
    }
    override func viewDidLoad(){
        super.viewDidLoad()

    }
    
}