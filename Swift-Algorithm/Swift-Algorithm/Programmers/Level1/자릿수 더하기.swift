//
//  자릿수 더하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/20.
//

import Foundation

func 자릿수더하기(_ n:Int) -> Int
{
    var stringNumArray = Array(String(n))
    var intNumArray = stringNumArray.map { Int(String($0))! }

    return intNumArray.reduce(0,+)
}

// Int 로 받은 숫자들을 -> String으로 바꿔줘야 Array에 1개씩 저장이 가능하다.
// 그런다음에 하나씩 mapping 해준다 정수형으로 그런다음에 reduce 써서 합쳐주자

// return String(n).reduce(0, {$0+Int(String($1))!})
// n을 String으로 바꾼 값을 reduce해주는데 거기서 Int로 바꿔서 계속해서 더해준다 !!


func whileSolution(_ n:Int) -> Int
{
    var answer:Int = 0
    var num: Int = n

    while num > 0 {
        answer += num % 10
        num = num / 10
    }
    return answer
}

// 반복문을 써서 그냥 10의 자리수로 나눠준다음에 더해주는 방식도 있다 !



func CompactMapSolution(_ n:Int) -> Int
{
    // 굳이 스트링 배열로 안만들어도 그냥 스트링으로 map해서 표현할 수 있다.
    let arr = String(n).compactMap { Int(String($0)) }
    return arr.reduce(0, +)
}
