//
//  소수만들기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/11/04.
//

import Foundation

func 소수만들기(_ nums:[Int]) -> Int {

    func isPrime(_ num: Int) -> Bool {
        var n = 2
        while n < num {
            if num % n == 0 { return false }
            n += 1
        }
        return true
    }

    var answer = 0

    for i in 0 ..< nums.count - 2 {
        for j in i + 1 ..< nums.count - 1 {
            for k in j + 1 ..< nums.count {
                if isPrime(nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}
