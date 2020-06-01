//
//  main.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/9.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

print("Bubble sort \(Bubble.sort([3, 4, 1, 6, 2, 5]))")
print("Binary find \(Binary.find([1, 2, 3, 4, 5, 6], 4))")
print("Selection sort \(Selection.sort([1, 3, 5, 4, 2]))")
print("=========================Recursive=================")
print("Factorial \(Recursive.f(list: [1, 2, 3, 4, 5]))")
print("Fiboncci \(Fibonacci.fibonacci(5))");
print("Recursive max \(Recursive.max(list: [1, 0, 25, 30, -1]))")
