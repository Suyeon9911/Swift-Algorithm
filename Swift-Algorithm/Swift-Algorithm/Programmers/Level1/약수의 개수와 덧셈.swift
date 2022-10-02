//
//  약수의 개수와 덧셈.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

func 약수의개수와덧셈(_ left:Int, _ right:Int) -> Int {

    var divisionNumCount: Int = 0
    var result: Int = 0

    for i in left...right {

        // 초기화
        divisionNumCount = 0

        for j in 1...i {
            if i % j == 0 {
                divisionNumCount += 1
            }
        }

        if divisionNumCount % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }

    return result
}


func 다른풀이(_ left: Int, _ right: Int) -> Int {
    return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}

func 다른풀이2(_ left:Int, _ right:Int) -> Int {
    var answer = 0

    for number in left...right{
        // floor 에 실수를 전달하면 소숫점 이하는 버림이 됨. sqrt 한 값이 정수면 홀수 ! 
        if floor(sqrt(Double(number))) == sqrt(Double(number)) {
            answer -= number
        } else {
            answer += number
        }
    }
    return answer
}
