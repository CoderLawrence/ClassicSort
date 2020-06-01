//
//  Fibonacci.swift
//  SortSwift
//
//  Created by Lawrence on 2020/5/28.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/**
 * Title: 斐波纳契数列
 *
 * Description: 斐波纳契数列，又称黄金分割数列，指的是这样一个数列：1、1、2、3、5、8、13、21、……
 * 在数学上，斐波纳契数列以如下被以递归的方法定义：F0=0，F1=1，Fn=F(n-1)+F(n-2)（n>=2，n∈N*）。
 *
 * 两种递归解法：经典解法和优化解法
 * 两种非递归解法：递推法和数组法
 * @author Lawrence
 */
class Fibonacci {
    /**
     * @description 经典递归法求解
     *
     * 斐波那契数列如下：
     *
     *  1,1,2,3,5,8,13,21,34,...
     *
     * *那么，计算fib(5)时，需要计算1次fib(4),2次fib(3),3次fib(2)，调用了2次fib(1)*，即：
     *
     *  fib(5) = fib(4) + fib(3)
     *
     *  fib(4) = fib(3) + fib(2) ；fib(3) = fib(2) + fib(1)
     *
     *  fib(3) = fib(2) + fib(1)
     *
     * 这里面包含了许多重复计算，而实际上我们只需计算fib(4)、fib(3)、fib(2)和fib(1)各一次即可，
     * 后面的optimizeFibonacci函数进行了优化，使时间复杂度降到了O(n).
     */
    class func fibonacci(_ n: Int) -> Int {
        // 递归终止条件
        if n == 1 || n == 2 {
            return 1
        }
        
        // 相同重复逻辑，缩小问题规模
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
