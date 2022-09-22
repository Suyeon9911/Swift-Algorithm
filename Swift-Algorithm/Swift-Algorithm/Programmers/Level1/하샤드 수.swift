//
//  하샤드 수.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 하샤드수(_ x:Int) -> Bool {
    // 자릿수의 합 구하기
    let numberArray = Array(String(x)).map { Int(String($0))! }

    return x % numberArray.reduce(0,+) == 0 ? true : false
    // x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
    // 더 간단하게 표현한 거 ! 근데 reduce가 많이 축약되어 있어서 그 안의 어 머시기를 알면 좋을 듯

}

// 요건 코드 가독성이 좋아서 가져와봄
func 하샤드수다른풀이(_ x:Int) -> Bool {
    var sum = String(x)
        .map{Int(String($0))!}
        .reduce(0, +)

    return x % sum == 0
}

// 요건 고차함수 없는 버전 풀이
func 하샤드수고차함수없는버전(_ x:Int) -> Bool {
    var sum: Int = 0
    var val = x

    while val > 0 {
        sum += val % 10
        val /= 10
    }

    return x % sum == 0
}
