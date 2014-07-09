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
//        self.dateViewController = DateViewController(nibName:nil, bundle:nil)
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        var imageFrame : CGRect = CGRectMake(0, 0, 106, 106)
//        CGRect imageFrame = CGRectMake(0, 0, 106, 70);
        
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        // CollectionView cellの設定
//        UICollectionViewFlowLayout *layout = [[[UICollectionViewFlowLayout alloc] init] autorelease];
        
        layout.itemSize                = imageFrame.size;          // CGSizeMake(50, 50); // セルのサイズ
        layout.headerReferenceSize     = CGSizeMake(320, 25);              // セクションごとのヘッダーのサイズ
        layout.footerReferenceSize     = CGSizeMake(0, 0);              // セクションごとのフッターのサイズ
        layout.minimumLineSpacing      = 1.0;                           // 行ごとのスペースの最小値
        layout.minimumInteritemSpacing = 1.0;                           // アイテムごとのスペースの最小値
        layout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);  // セクションの外枠のスペース
        
//        MYDateAssetCollectionViewController *dateAssetCVC = [[MYDateAssetCollectionViewController alloc] initWithCollectionViewLayout:layout];
//        [self.view addSubview:dateAssetCVC.view];
        
        
        self.dateViewController = DateViewController(collectionViewLayout:layout)
        
        var tabs = [self.dateViewController!]
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(tabs, animated: true)
        
        self.view!.addSubview(tabBarController.view)
    }
    
}