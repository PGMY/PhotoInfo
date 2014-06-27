//
//  DateViewController.swift
//  PhotoInfo
//
//  Created by Mika Yamamoto on 2014/06/27.
//  Copyright (c) 2014年 Mika Yamamoto. All rights reserved.
//

import UIKit
import AssetsLibrary

class DateViewController: UICollectionViewController {
    //
    let ASSET :Int = 0
    let DATE :Int = 1
    let DATE_STR :Int = 2
    //
    var sectionList:Array<String>?
    var assetsData:Dictionary<String,AnyObject>?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
        self.view!.backgroundColor = UIColor.redColor()
        
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupAssetsLibrary()
    }
    
    
    func setupAssetsLibrary () {
        // Asset Group Type
        let assetsGroupType :ALAssetsGroupType = Int(ALAssetsGroupAlbum) | Int(ALAssetsGroupEvent) | Int(ALAssetsGroupFaces) | Int(ALAssetsGroupSavedPhotos);
        
        // Date Format
        var fomatter = NSDateFormatter()
        fomatter.dateFormat = "yyyy/MM/dd"
        
        //
        var allAssets: Array<AnyObject> = []
        
        var groupResultBlock : ALAssetsGroupEnumerationResultsBlock = { (asset: ALAsset!, index: Int, stop:CMutablePointer<ObjCBool>) -> Void in
            if asset {
                let assetDate: NSDate = asset.valueForProperty(ALAssetPropertyDate) as NSDate
                let assetDateStr = fomatter.stringFromDate(assetDate)
                allAssets.append([self.ASSET:asset, self.DATE:assetDate, self.DATE_STR:assetDateStr])
            }
        }
        
        
        

        
    }
    
}