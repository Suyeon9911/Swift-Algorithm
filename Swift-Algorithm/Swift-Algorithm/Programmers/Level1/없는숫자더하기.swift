//
//  없는숫자더하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/26.
//

import Foundation

func 없는숫자더하기(_ numbers:[Int]) -> Int {

    var answer = Array(0...9)

    for i in 0...9 {
        if numbers.contains(i) {
            answer.removeAll(where: { $0 == i })
        }
    }

    return answer.reduce(0,+)
}

func 없는숫자(_ numbers: [Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}

func 없는숫자2(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0, +)
}


func 없는숫자3(_ numbers:[Int]) -> Int {

    var answer = 0
    for n in 0...9 {
        // 이런방법도 있네용 제거하는것보다 더하는게 더 빠르겠당
        if !numbers.contains(n) {
            answer += n
        }
    }
    return answer
}
