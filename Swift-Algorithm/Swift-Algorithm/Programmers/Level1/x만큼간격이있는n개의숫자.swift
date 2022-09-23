//
//  x만큼간격이있는n개의숫자.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

// 정수 x와 자연수 n을 입력 받아, x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴
func solution(_ x:Int, _ n:Int) -> [Int64] {
    var resultArray: [Int64] = []
    // to는 넣은 파라미터 숫자를 포함하지 않는다.
    // through는 넣은 파라미터 수를 포함한다.
    for i in stride(from: x, through: x*n, by: x) {
        resultArray.append(Int64(i))
    }

    // 이건 왜 안된걸까?

    return resultArray
}


func 다시풀었다(_ x:Int, _ n:Int) -> [Int64] {
    var resultArray: [Int64] = []
    var number = x
    // to는 넣은 파라미터 숫자를 포함하지 않는다.
    // through는 넣은 파라미터 수를 포함한다.

    for _ in 1...n {
        resultArray.append(Int64(number))
        number = number + x
    }
    // n 만큼 반복해서 배열에 추가

    return resultArray
}


func 다른풀이참고(_ x:Int, _ n:Int) -> [Int64] {
    // 아하 일단 1 부터 n 까지의 배열을 만든다음에 각각 x를 곱해줬구나...
    return Array(1...n).map { Int64($0 * x) }
}

func 다른풀이참고2(_ x:Int, _ n:Int) -> [Int64] {
    var arr: [Int] = []

    for num in 1...n {
        arr.append(x * num)
    }

    return arr.map {
        Int64($0)
    }
}

