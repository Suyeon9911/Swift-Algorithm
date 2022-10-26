//
//  두개 뽑아서 더하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

func 두뽑더(_ numbers:[Int]) -> [Int] {

    var result: [Int] = []

    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            var sum = numbers[i] + numbers[j]
            if !result.contains(sum) {
                result.append(sum)
            }
        }
    }

    return result.sorted()
}
