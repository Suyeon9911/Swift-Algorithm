//
//  콜라츠추측.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

/*
 그리디 유형 느낌
 1-1. 입력된 수가 짝수라면 2로 나눕니다.
 1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
 2. 결과로 나온 수에 같은 작업을 1이 될 때까지 반복합니다.
 */

func 콜라츠추측(_ num:Int) -> Int {

    var count: Int = 0
    var number = num

    while number != 1 && count < 501 {
        if number % 2 == 0 {
            // 입력된 수가 짝수라면
            number = number / 2
            count += 1
        } else {
            number = (number * 3) + 1
            count += 1
        }
    }

    // count 가 500이 넘어가면
    if count > 500 {
        count = -1
    }

    return count
}

// 따로 메서드로 빼서 작업 ! 

func oddCalculation(_ n: Int) -> Int {
    return n * 3 + 1
}

func evenCalculation(_ n: Int) -> Int {
    return n / 2
}

func 콜라츠(_ num: Int) -> Int {
    var count: Int = 0
    var resultNumber = num

    while resultNumber != 1 && count < 501 {
        // 삼항연산자 사용
        resultNumber = resultNumber % 2 == 0 ? evenCalculation(resultNumber) : oddCalculation(resultNumber)
        count += 1
    }

    return count > 500 ? -1 : count
}
