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
    var sectionList:Array<String> = Array<String>()
    var assetsData:Dictionary<String,Array<ALAsset>> = Dictionary<String,Array<ALAsset>>()
    
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle!) {
//        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
//        
//    }
    init(collectionViewLayout layout: UICollectionViewLayout!){
        super.init(collectionViewLayout:layout)
    }
    
    override func loadView() {
        super.loadView()
        
//        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view!.backgroundColor = UIColor.yellowColor()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupAssetsLibrary()
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
//        [self.collectionView setBackgroundColor:[UIColor whiteColor]];
//        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
//        [self.collectionView registerClass:[MYCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear( animated )
        println("APPEAR")
        
    }
    

    
    
    func setupAssetsLibrary () {
        // Asset Group Type
//        println(ALAssetsGroupAll)
        let assetsGroupType :ALAssetsGroupType! = ALAssetsGroupType(0xFFFFFFFF)
//        let assetsGroupType = ALAssetsGroupAll;//(ALAssetsGroupAlbum) | Int(ALAssetsGroupEvent) | Int(ALAssetsGroupFaces) | Int(ALAssetsGroupSavedPhotos);
        
        // Date Format
        var fomatter = NSDateFormatter()
        fomatter.dateFormat = "yyyy/MM/dd"
        
        //
        var allAssets: Array<Dictionary<Int,AnyObject>> = []
        
        var groupResultBlock : ALAssetsGroupEnumerationResultsBlock = { (asset: ALAsset!, index: Int, stop:CMutablePointer<ObjCBool>) -> Void in
            if asset {
                let assetDate: NSDate = asset.valueForProperty(ALAssetPropertyDate) as NSDate
                let assetDateStr: String = fomatter.stringFromDate(assetDate) as String
                allAssets.append([self.ASSET:asset, self.DATE:assetDate, self.DATE_STR:assetDateStr])
            }
        }
//        AssetsAccessor
        var resultBlock : ALAssetsLibraryGroupsEnumerationResultsBlock = { (assetsGroup:ALAssetsGroup!, stop: CMutablePointer<ObjCBool>) -> Void in
            let onlyPhotosFilter: ALAssetsFilter = ALAssetsFilter.allPhotos()
//            if ( assetsGroup != nil ){
            if assetsGroup {
                assetsGroup.setAssetsFilter( onlyPhotosFilter )
                if assetsGroup.numberOfAssets() > 0 {
                    assetsGroup.enumerateAssetsUsingBlock(groupResultBlock)
                }
            } else {
                sort( allAssets ){ $0[self.DATE_STR] as String > $1[self.DATE_STR] as String }
                
                for anAsset: Dictionary<Int,AnyObject> in allAssets {
                    let assetDict: NSDictionary = anAsset
                    let dateStr: String! = assetDict[self.DATE_STR] as String
                    if self.assetsData[dateStr] {
                        var asstsArr:Array<ALAsset> = self.assetsData[dateStr]!
                        asstsArr.append(anAsset[self.ASSET] as ALAsset)
                        self.assetsData[dateStr] = asstsArr
//                        println(asstsArr.count)
//                        println(self.assetsData[dateStr]!.count)
//                        println("======")
                    } else {
                        var sectionArray:Array<ALAsset> = []
                        sectionArray.append(anAsset[self.ASSET] as ALAsset)
                        self.assetsData[dateStr] = sectionArray
                        self.sectionList.append(dateStr)
                    }

                }
                self.collectionView!.reloadData()
            }
            
            
        }
        
        var failureBlock : ALAssetsLibraryAccessFailureBlock = { (error:NSError!) -> Void in }
//
//        ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *assetsGroup, BOOL *stop) {
//            //        NSLog(@"AssetsGroup : %@", assetsGroup);
//            ALAssetsFilter *onlyPhotosFilter = [ALAssetsFilter allPhotos];
//            [assetsGroup setAssetsFilter:onlyPhotosFilter];
//            if (assetsGroup) {
//                if ([assetsGroup numberOfAssets] > 0) {
//                    [assetsGroup enumerateAssetsUsingBlock:groupResultBlock];
//                }
//            } else {
//                // 全体sort
//                [allAssets sortWithOptions:NSSortConcurrent usingComparator:comparetor];
//                for (NSDictionary *asset in allAssets) {
//                    NSString *dateStr = asset[DATE_STR];
//                    if (self.assetsData[dateStr]) {   // 存在していたら
//                        [self.assetsData[dateStr] addObject:asset[ASSET]];
//                    } else {
//                        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
//                        [sectionArray addObject:asset[ASSET]];
//                        [self.assetsData setObject:sectionArray forKey:dateStr];
//                        [sectionArray release];
//                        [self.sectionList addObject:dateStr];
//                    }
//                }
//                [formatter release];
//                [allAssets release];
//                [self.collectionView reloadData];
//            }
//        };
//        
//        ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error) {
//        };
//        
//        
//        [[[AssetsAccessor sharedInstance] assetsLibrary] enumerateGroupsWithTypes:assetsGroupType usingBlock:resultBlock failureBlock:failureBlock];
//        
        
        let accessor: AssetsAccessor = AssetsAccessor.sharedInstance
        accessor.assetsLibrary!.enumerateGroupsWithTypes(assetsGroupType, usingBlock: resultBlock, failureBlock: failureBlock)
//        enumerateGroupsWithTypes(types: ALAssetsGroupType, usingBlock enumerationBlock: ALAssetsLibraryGroupsEnumerationResultsBlock!, failureBlock: ALAssetsLibraryAccessFailureBlock!)
    }
    
    // CollectionView DataSource -------------------------------------------------------------------------------------------------------------------
    
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        println("Items in section count = \((self.assetsData[self.sectionList[section] as String] as Array).count)")
        return (self.assetsData[self.sectionList[section] as String] as Array).count
//        [self.assetsData[self.sectionList[section]] count];
//        return 3;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cellID: String = "UICollectionViewCell"
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath:indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.blueColor()
        
        //        var asset: ALAsset =
        var date: String = self.sectionList[indexPath.section]
        var assetArr:Array<ALAsset> = self.assetsData[date]!
        var asset: ALAsset = assetArr[indexPath.row]
        var img: UIImage = UIImage(CGImage:asset.aspectRatioThumbnail().takeUnretainedValue())
        var imgView:UIImageView = UIImageView()
        imgView.image = img
//        imgView.contentMode
        imgView.frame = CGRectMake(0, 0, 106, 70)
        cell.addSubview(imgView)
        
//        init(CGImage cgImage: CGImage!)
        
        
        
        //    static NSString      *cellID = @"UICollectionViewCell";
        //    UICollectionViewCell *cell   = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        //
        //    ALAsset *asset = self.assetsData[self.sectionList[indexPath.section]][indexPath.row];
        //    UIImage *img   = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]]; //thumbnail]];
        //
        //    UIImageView *imgView = [[UIImageView alloc] init];
        //    [imgView setImage:img];
        //    [imgView setContentMode:UIViewContentModeScaleAspectFit];
        //    imgView.frame = CGRectMake(0, 0, 106, 70);
        //    imgView.backgroundColor = [UIColor blackColor];
        //    
        //    [cell addSubview:imgView];
        //    
        //    
        //    return cell;
        return cell
    }
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        println("section count = \(self.sectionList.count)")
        return self.sectionList.count
    }
    
    
//    // -------------------------------------------------------------------------------------------------------------------
//    #pragma mark - CollectionView DataSource
//    // -------------------------------------------------------------------------------------------------------------------
//    
//    - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//    {
//    return [self.sectionList count]; // [self.assetsSection count];
//    }
//    
//    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//    {
//    return [self.assetsData[self.sectionList[section]] count];
//    }
//    
//    - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//    {
//    MYCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//    withReuseIdentifier:@"header"
//    forIndexPath:indexPath];
//    
//    headerView.title.text = self.sectionList[indexPath.section];
//    [headerView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
//    return headerView;
//    }
//    
//    // Method to create cell at index path
//    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//    {
//    static NSString      *cellID = @"UICollectionViewCell";
//    UICollectionViewCell *cell   = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    
//    ALAsset *asset = self.assetsData[self.sectionList[indexPath.section]][indexPath.row];
//    UIImage *img   = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]]; //thumbnail]];
//    
//    UIImageView *imgView = [[UIImageView alloc] init];
//    [imgView setImage:img];
//    [imgView setContentMode:UIViewContentModeScaleAspectFit];
//    imgView.frame = CGRectMake(0, 0, 106, 70);
//    imgView.backgroundColor = [UIColor blackColor];
//    
//    [cell addSubview:imgView];
//    
//    
//    return cell;
//    }
//    
//    // -------------------------------------------------------------------------------------------------------------------
//    #pragma mark - CollectionView Delegate
//    // -------------------------------------------------------------------------------------------------------------------
//    
//    - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//    {
//    // クリックされたらよばれる
//    NSLog(@"Clicked %ld-%ld", indexPath.section, indexPath.row);
//    
//    }

    
}











