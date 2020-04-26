//
//  Insert.swift
//  LeetCode
//
//  Created by Lawrence on 2020/4/10.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class Insert {
    class func sort(_ array: [Int]) ->[Int] {
        guard array.count > 0 else {
            return array
        }
        
        var result: [Int] = array
        for i in 1..<result.count {
            let temp = result[i]
            var j: Int = i
            while j > 0 && temp < result[j - 1] {
                result[j] = result[j - 1]
                j -= 1
            }
            
            if j != i {
                result[j] = temp
            }
        }
        
        return result
    }
}
