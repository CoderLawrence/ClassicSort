//
//  Matrix.swift
//  LeetCode
//
//  Created by Lawrence on 2020/4/7.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 矩阵倒转
class Matrix {
    class func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count
        for i in 0..<len {
            for j in i + 1..<len {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        let mid = len/2
        for i in 0..<len {
            for j in 0..<mid {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[i][len - 1 - j]
                matrix[i][len - 1 - j] = temp
            }
        }
    }
}
