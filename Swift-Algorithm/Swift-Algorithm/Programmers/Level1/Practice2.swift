//
//  Practice2.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/19.
//

import Foundation

func solution(_ arr:[Int]) -> Double {
    // swift에서는 sum 메서드가 없군 헷갈리지말자
    // reduce는 배열의 각 항목들을 재귀적으로 클로저를 적용시켜 하나의 값을 만듭니다.
    // array.reduce(0) { $0 + $1 }
    // 스위프트는 연산자의 띄어쓰기도 중요하다.

    return Double(arr.reduce(0,+)) / Double(arr.count)
}


func solution2(_ arr:[Int]) -> Double {
    var sum: Int = 0

    for i in 0..<arr.count {
        sum = sum + arr[i]
    }
    // reduce 기능을 직접 반복문으로 구현할 경우.

    return Double(sum)/Double(arr.count)
}
