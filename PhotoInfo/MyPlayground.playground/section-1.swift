// Playground - noun: a place where people can play

import UIKit

// http://qiita.com/hachinobu/items/d591d0cba23b6dfec559
// immutableなString型の配列
let names: String[] = ["name5", "name2", "name1", "name3"]

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
sort(programLang) { $0 > $1 } // [ひまわり, Swift, Scala, Ruby, Python, PHP, Objective-C, JavaScript, Java]

// 配列内をソート(昇順)
sort(programLang) { $0 < $1 } // [Java, JavaScript, Objective-C, PHP, Python, Ruby, Scala, Swift, ひまわり]

programLang.count

programLang