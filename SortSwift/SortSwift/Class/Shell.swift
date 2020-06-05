//
//  Shell.swift
//  SortSwift
//
//  Created by Lawrence on 2020/6/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class Shell {
    class func sort<T:Comparable>(array:[T]) ->[T] {
        var results = array
        var gap = 1
        while gap < results.count/3 {
            gap = gap * 3 + 1
        }
        
        while gap > 0 {
            for i in gap..<results.count {
                let temp = results[i]
                var j = i - gap
                while j > 0 && array[j] > temp {
                    results[j + gap] = results[j]
                    j -= gap
                }
                
                results[j + gap] = temp
            }
            
            gap = Int(floor(Double(gap/3)))
        }
        
        return results
    }
}
