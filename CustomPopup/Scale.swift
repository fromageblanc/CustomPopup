//
//  Scale.swift
//  Scale
//
//  Created by 吉田誠志 on 2016/11/22.
//  Copyright © 2016年 agoows. All rights reserved.
//

import UIKit

enum Root:Int {
    case C = 0
    case Cs
    case D
    case Ds
    case E
    case F
    case Fs
    case G
    case Gs
    case A
    case As
    case B
}

let Intervals:[[String:Any]] = [
    ["name":"major scale","interval":[0,2,2,1,2,2,2,1]],
    ["name":"natural minor scale","interval":[0,2,1,2,2,1,2,2]],
    ["name":"harmonic minor scale","interval":[0,2,1,2,2,1,3,1]],
    ["name":"major triard chord","interval":[0,4,3,5]],
    // mode
    ["name":"ionian scale","interval":[0,2,2,1,2,2,2,1]],
    ["name":"dorian scale","interval":[0,2,1,2,2,2,1,2]],
    ["name":"phrygian sclae","interval":[0,1,2,2,2,1,2,2]],
    ["name":"lydian scale","interval":[0,2,2,2,1,2,2,1]],
    ["name":"mixolydian scale","interval":[0,2,2,1,2,2,1,2]],
    ["name":"aeorian scale","interval":[0,2,1,2,2,1,2,2]],
    ["name":"locrian scale","interval":[0,1,2,2,1,2,2,2]],
    /*
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    ["name":"xxxxxxxxxxxx","interval":[0,0,0,0,0]],
    */
]

class Scale: NSObject {
    
    // 鍵盤情報 markは動的要素
    private var keyProperties:[[String:Any]] =
        [
            ["index":"0","name":"C","mark":false],
            ["index":"1","name":"Cs","mark":false],
            ["index":"2","name":"D","mark":false],
            ["index":"3","name":"Ds","mark":false],
            ["index":"4","name":"E","mark":false],
            ["index":"5","name":"F","mark":false],
            ["index":"6","name":"Fs","mark":false],
            ["index":"7","name":"G","mark":false],
            ["index":"8","name":"Gs","mark":false],
            ["index":"9","name":"A","mark":false],
            ["index":"10","name":"As","mark":false],
            ["index":"11","name":"B","mark":false],
            ["index":"12","name":"C","mark":false],
            ["index":"13","name":"Cs","mark":false],
            ["index":"14","name":"D","mark":false],
            ["index":"15","name":"Ds","mark":false],
            ["index":"16","name":"E","mark":false],
            ["index":"17","name":"F","mark":false],
            ["index":"18","name":"Fs","mark":false],
            ["index":"19","name":"G","mark":false],
            ["index":"20","name":"Gs","mark":false],
            ["index":"21","name":"A","mark":false],
            ["index":"22","name":"As","mark":false],
            ["index":"23","name":"B","mark":false],
            ["index":"24","name":"C","mark":false]
        ]
    

    override init() {
        super.init()

        for i in 0..<keyProperties.count {
            keyProperties[i]["mark"] = false
        }
    }
    
    // func
    
    func getKeyProperties() -> [[String:Any]] {
        return self.keyProperties
    }
    
    func propertiesReset() {
        for i in 0..<keyProperties.count {
            keyProperties[i]["mark"] = false
        }
    }

    func setMarkAttributeFor(_ interval:[Int],root:Root) {
        
        var index:Int = root.rawValue
        var pos:Int = 0
        var keyCount:Int = 0
        let lastIndex:Int = keyProperties.count - 1
        
        while keyCount < keyProperties.count {
            
            for i in 0 ..< interval.count {
                
                keyCount += interval[i]
                if keyCount > keyProperties.count {
                    break
                }
                
                index += interval[i]
                
                if index == lastIndex {
                    keyProperties[0]["mark"] = true
                    keyProperties[lastIndex]["mark"] = true
                } else if index > lastIndex {
                    pos = index - lastIndex
                    print("over range :pos=\(pos)")
                    
                    if pos > lastIndex {
                        break
                    }
                    
                } else {
                    pos = index
                }
                keyProperties[pos]["mark"] = true
            }
        }
    }
}

