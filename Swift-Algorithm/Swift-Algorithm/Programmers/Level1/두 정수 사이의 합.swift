//
//  두 정수 사이의 합.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 두정수사이의합(_ a:Int, _ b:Int) -> Int64 {

    var intArray: [Int] = []

    // a랑 b의 대소관계가 정해져있지 않아서 .. 얘를 비교하고 반복문을 돌려야하는데
    // 더 효율적인 방법이 없을까 ?
    let firstNum = a < b ? a : b
    let lastNum = a > b ? a : b

    // (a < b) ? a...b : b...a

    let range = a < b ? a...b : b...a // 요걸로 돌리기 -> 통과 완료 !

    for i in firstNum..<lastNum+1 {
        intArray.append(i)
    }

    return Int64(intArray.reduce(0,+))
}

// 우와 수열 공식 사용해서 풀음 . a+b * b-a+1 / 2
func 수열공식사용풀이(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}

