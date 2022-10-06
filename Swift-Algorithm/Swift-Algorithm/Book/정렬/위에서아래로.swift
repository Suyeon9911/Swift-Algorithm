//
//  위에서아래로.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation
/*
 정렬 :
 3
 15
 27
 12
 */

func 위에서아래로() {

    let n = Int(readLine()!)!
    var nums: [Int] = []

    for _ in 0..<n {
        nums.append(Int(readLine()!)!)
    }

    nums.sort()

    for i in nums {
        print(i, terminator: " ")
    }
}
