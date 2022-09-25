//
//  제일작은수제거.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/25.
//

import Foundation

func 제일작은수제거(_ arr:[Int]) -> [Int] {
    let minValue = arr.min()!
    let firstIndex = arr.firstIndex(of: minValue)!

    var answer = arr
    answer.remove(at: firstIndex)

    return answer.isEmpty ? [-1] : answer
}

// 여기서 arr로 접근해서 remove하려니까 계속 안되더라.. !!

func 제일작은수제거다른방법(_ arr:[Int]) -> [Int] {
    let minValue = arr.min()!

    var answer = arr
    answer.removeAll(where: {$0 == minValue})

    return answer.isEmpty ? [-1] : answer
}

func 제일작은수제거다른방법2(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0] // 정렬해서 접근
    return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
}



