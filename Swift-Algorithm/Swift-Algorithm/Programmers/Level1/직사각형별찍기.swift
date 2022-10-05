//
//  직사각형별찍기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/05.
//

import Foundation

// 직사각형 별찍기

func 직사각형별찍기() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for i in 0..<b {
        for j in 0..<a {
            print("*", terminator: "")
        }
        print("")
    }

    // 다른 풀이
    for _ in 0..<b {
        print(Array(repeating: "*", count: a).joined())
    }
}
