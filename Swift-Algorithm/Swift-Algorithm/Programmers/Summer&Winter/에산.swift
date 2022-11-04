//
//  에산.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/13.
//

import Foundation

func 예산(_ d:[Int], _ budget:Int) -> Int {
    // 완전 탐색 : 금액 계산
    var price = 0
    var count = 0

    var d = d.sorted()

    for i in d {
        if price + i <= budget {
            price += i
            count += 1
        } else {
            break
        }
    }

    return count
}
// sorting - 정렬 + 그리디. 단순히 작은 수부터 계산하면 된다. 더한게 예산보다 작을 경우에 더해주는걸로 계산 

// 다른 풀이

func 예산다른풀이(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget

    return d.sorted().filter {
        budget = budget - $0
        return budget >= 0
    }.count
}

func 예산다른풀이2(_ d:[Int], _ budget:Int) -> Int {

    var arr = d
    var total = 0
    var number = 0
    arr.sort()

    for i in 0..<arr.count {
        total += arr[i]
        if total <= budget {
            number = i + 1
        }
    }
    return number
}
