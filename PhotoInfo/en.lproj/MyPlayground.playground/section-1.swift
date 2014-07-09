// Playground - noun: a place where people can play

import UIKit
import AssetsLibrary





var fomatter = NSDateFormatter()
fomatter.dateFormat = "yyyy/MM/dd"
fomatter






// http://qiita.com/hachinobu/items/d591d0cba23b6dfec559
// immutableなString型の配列
let names: [String] = ["name5", "name2", "name1", "name3"]

//各データを取得
let name1 = names[0] //name5
let name2 = names[1] //name2
let name3 = names[2] //name1
let name4 = names[3] //name3

//各件数
names.capacity // 4
names.startIndex // 0
names.endIndex // 4
names.count // 4


// mutableなString型の配列
var programLang = ["Objective-C", "Java"]

// データ追加
programLang.append("Swift") // [Objective-C, Java, Swift]
programLang += "Python" // [Objective-C, Java, Swift, Python]

let addLang = ["Ruby", "PHP"]
programLang.extend(addLang) // [Objective-C, Java, Swift, Python, Ruby, PHP]
programLang += ["Scala", "JavaScript"] // [Objective-C, Java, Swift, Python, Ruby, PHP, Scala, JavaScript]

programLang.insert("ひまわり", atIndex: 0) // [ひまわり, Objective-C, Java, Swift, Python, Ruby, PHP, Scala, JavaScript]

// 配列の中身を逆順にする
programLang.reverse() // [ひまわり, Objective-C, Java, Swift, Python, Ruby, PHP, Scala, JavaScript]

// 配列内をソート(降順)
sort(&programLang) { $0 > $1 } // [ひまわり, Swift, Scala, Ruby, Python, PHP, Objective-C, JavaScript, Java]

// 配列内をソート(昇順)
sort(&programLang) { $0 < $1 } // [Java, JavaScript, Objective-C, PHP, Python, Ruby, Scala, Swift, ひまわり]

programLang.count

programLang

let key :Int = 1
var arr:Array<Dictionary<Int,String>> = []
arr.append([1:"ONE", 2:"TWO"])
arr.append([1:"TRE", 2:"FOR"])

//arr
//sort(arr){$0[key] > $1[key] }
//
//arr

//ALAssetsGroupAll

//ALAssetsGroupType(ALAssetsGroupAll)


var any:AnyObject? = "TEST"
any as String




var testArr:Array<Dictionary<Int,String>> = [[0: "ZERO1", 1: "2013-11-02 14:52:00 +0000", 2: "2013/11/02"],[0: "ZERO5", 1: "2013-11-02 14:52:00 +0000", 2: "2013/11/02"],[0: "ZERO3", 1: "2013-11-02 14:52:00 +0000", 2: "2013/11/02"],[0: "ZERO4", 1: "2013-11-02 14:52:00 +0000", 2: "2013/11/02"]]

sort(&testArr) {
    (a:Dictionary, b:Dictionary) -> Bool in
    var s = a
    println(a)
    println(b)
    println(a[0])
    println(b[0])
    let aStr = a[0]
    
    let ret:Bool = a[0] > b[0]
    println("=====")
    
    return a[0] > b[0]
}

testArr

for test:Dictionary<Int,String> in testArr {
    let td: NSDictionary = test
    let t:String! = td[0] as String
    println(t)
}


var testDict : Dictionary<String,Array<String>> = ["A":["a","b","c"],"B":["a","b","c"],"C":["a","b","c"]]
var dcitD:Array<String> = ["A","B","C"]
testDict["D"] = dcitD

testDict



