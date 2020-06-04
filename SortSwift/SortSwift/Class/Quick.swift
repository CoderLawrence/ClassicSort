//
//  Quick.swift
//  SortSwift
//
//  Created by Lawrence on 2020/6/2.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class Quick {
    class func sort<T: Comparable>(_ list: [T]) -> [T] {
        if list.count < 2 {
            return list
        } else {
            let pivot = list[0]
            let less = list.filter{$0 < pivot}
            let equal = list.filter{$0 == pivot}
            let greater = list.filter{$0 > pivot}
            return sort(less) + equal + sort(greater)
        }
    }
}
