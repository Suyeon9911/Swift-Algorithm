//
//  나누어떨어지는 숫자배열.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/25.
//

import Foundation

func 나누어떨어지는숫자배열(_ arr:[Int], _ divisor:Int) -> [Int] {

    var answer: [Int] = []

    for i in arr {
        if i % divisor == 0 {
            answer.append(i)
        }
    }

    if answer.count == 0 {
        return [-1]
    }

    return answer.sorted()
}

func 나떨숫다른풀이(_ arr:[Int], _ divisor:Int) -> [Int] {
    // 먼저 정렬 후 필터로 남기기
    let array = arr.sorted().filter{ $0 % divisor == 0 }
    return  array == [] ? [-1] : array

    /*

    // 필터 후 정렬도 가능.
    let result = arr.filter{ $0 % divisor == 0}.sorted()
    return result.count == 0 ? [-1] : result

    // .isEmpty 사용가능 배열
     
    return result.isEmpty ? [-1] : result

     */
}

