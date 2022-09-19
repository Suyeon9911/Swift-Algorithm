//
//  Practice3.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/19.
//

import Foundation

func solution(_ n:Int) -> Int {
    var array: [Int] = []

    for i in 1..<n+1 {
        if n % i == 0 {
            array.append(i)
        }
    }

    return array.reduce(0,+)
}

// for 문 범위에서 index가 이상해서 테케 1개가 통과가 안되었었당ㅇ... 1...n에서 1..< n+1로 바꾸니까 됨
// 16번이 0이어서 그런거였다 ~~

/*
 signal: illegal instruction (core dumped)
 이 에러는 배열이 index out of range거나, 옵셔널, 혹은 잘못된 수식 때문에 생긴다.
 */

func solution2(_ n:Int) -> Int {
    // 0 일경우.. !
    guard n != 0 else {
        return 0
    }

    // 1부터 n 까지 배열에서 필터링 해서 reduce
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}

// 0 일때 예외를 이렇게 해줄수도 있따. 요걸 안해서 1...n이 안된거였군 !! 

func solution3(_ n:Int) -> Int {
    return n != 0 ? (1...n).filter{n % $0 == 0}.reduce(0){$0 + $1} : 0
}
