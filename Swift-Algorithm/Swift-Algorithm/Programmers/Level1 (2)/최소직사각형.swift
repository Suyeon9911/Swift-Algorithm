//
//  최소직사각형.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation


func 최소직사각형답(_ sizes:[[Int]]) -> Int {
    var size = sizes


    var height: [Int] = []
    var width: [Int] = []

    // 가로 세로 상관 없이 짧은 쪽을 세로로 놓고 긴쪽을 가로로 놔서 걍 젤 긴거에 맞추는 그런 느낌임다 !

    for i in 0..<size.count {
        size[i].sort() // 50 60

        height.append(size[i][0]) // 50 30 30 40
        width.append(size[i][1]) // 60 70 60 80
    }


    return height.max()! * width.max()!
}

/*
 ✅ 알고리즘

 큰 길이는 큰 길이대로 모아서 비교하고

 짧은 길이는 짧은 길이대로 모아서 비교한다.

 가로 세로에 얽매이면 안돼 끝
 */

func 최소직(_ sizes:[[Int]]) -> Int {
    var long = 0
    var short = 0

    sizes.forEach { size in
        let tempLong = max(size[0], size[1])
        let tempShort = min(size[0], size[1])

        long = max(long, tempLong)
        short = max(short, tempShort)
    }
    // forEach 오호라

    return long * short
}

//
//func solution(_ sizes:[[Int]]) -> Int {
//    var width = 0, height = 0
//    sizes.forEach {
//        width = max(width, $0.max()!)
//        height = max(height, $0.min()!)
//    }
//
//    return width * height
//}

//func solution(_ sizes:[[Int]]) -> Int {
//    var maxNum = 0
//    var minNum = 0
//
//    for size in sizes {
//        maxNum = max(maxNum, size.max()!)
//        minNum = max(minNum, size.min()!)
//    }
//    return maxNum * minNum
//}
