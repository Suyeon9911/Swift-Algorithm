//
//  내적.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/26.
//

import Foundation

func 내적(_ a:[Int], _ b:[Int]) -> Int {

    var answer: Int = 0

    for i in 0..<a.count {
        answer += a[i] * b[i]
    }
    return answer
}

func 내적다른풀이(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
    // zip 고차함수에 대해서 공부
}
