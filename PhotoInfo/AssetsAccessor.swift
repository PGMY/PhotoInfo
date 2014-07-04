//
//  AssetsAccesso.swift
//  PhotoInfo
//
//  Created by Mika Yamamoto on 2014/06/27.
//  Copyright (c) 2014年 Mika Yamamoto. All rights reserved.
//

import UIKit
import AssetsLibrary

//class AssetsAccessor {
//    class var sharedInstance: AssetsAccessor {
//        struct Singleton {
//            static let instance = AssetsAccessor()
//        }
//        return Singleton.instance
//    }
//}


class AssetsAccessor {
    
    var assetsLibrary :ALAssetsLibrary?
    
    class var sharedInstance : AssetsAccessor {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : AssetsAccessor? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = self()
        }
        return Static.instance!
    }
    
    @required init() {
        if self.assetsLibrary == nil {
            self.assetsLibrary = ALAssetsLibrary()
        }
    }
}

//let _SingletonASharedInstance = SingletonA()
//
//class SingletonA  {
//
//    class var sharedInstance : SingletonA {
//        return _SingletonASharedInstance
//    }
//
//}


//class var sharedController : FooController
//{
//struct Singleton {
//    static let instance = FooController()
//    }
//    return Singleton.instance
//}



