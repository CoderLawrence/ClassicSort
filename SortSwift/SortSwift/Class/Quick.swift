//
//  Quick.swift
//  SortSwift
//
//  Created by Lawrence on 2020/6/2.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 快排
/// 时间复杂度：O(Nlog N)
/// 思想：选定某一个位置的值作为支点，然后将数组一分为二，大于支点的元素和小于支点的元素。
/// 将这个过程递归直到不可分割位置，然后将整个递归的结果串联起来便是排好序的数组
class Quick {
    class func sort<T: Comparable>(_ list: [T]) -> [T] {
        if list.count < 2 {
            return list
        } else {
            // 支点
            let pivot = list[list.count/2]
            // 小于、等于、大于支点
            let less = list.filter{$0 < pivot}
            let equal = list.filter{$0 == pivot}
            let greater = list.filter{$0 > pivot}
            return sort(less) + equal + sort(greater)
        }
    }
}
