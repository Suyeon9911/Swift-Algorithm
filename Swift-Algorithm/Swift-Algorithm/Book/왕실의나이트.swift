//
//  왕실의나이트.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/26.
//

import Foundation


func getASCII(char: String) -> UInt8? {
    return Character(char).asciiValue
}

func 왕실의나이트() {
    let position = readLine()!

    // a1을 어떻게든 분리하려고... 킹 ..
    let row: Int = Int(String(Array(position)[1]))!
    // let row2 = Int(String(position[position.index(position.startIndex, offsetBy: 1)]))
    let column: Int = Int(getASCII(char: String(Array(position)[0]))!) - Int(getASCII(char: "a")!) + 1

    // 나이트가 이동할 수 있는 8가지 방향 정의
    let steps = [(-2,-1),(-1,-2),(1,-2),(2,-1),(2,1),(1,2),(-1,2),(-2,1)]
    // 8가지 방향에 대해서 각 위치로 이동이 가능한지 확인

    var result: Int = 0

    for step in steps {
        let nextRow = row + step.0
        let nextCol = column + step.1

        if nextRow >= 1 && nextRow <= 8 && nextCol >= 1 && nextCol <= 8 {
            result += 1
        }
    }

    print(result)
}
