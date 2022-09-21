//
//  문자열 내 p와 y의 개수.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/22.
//

import Foundation

// 나는 일단 문자열을 전부 소문자로 바꾸고 하나씩 돌면서 세주었다.
// str = str.lowercased()
// str = str.uppercased()

// 처음에 소문자 p랑 y만 세는 건줄 !


func 문자열내p와y(_ s:String) -> Bool
{
    var yCount: Int = 0
    var pCount: Int = 0

    for i in s.lowercased() {
        if i == "y" {
            yCount += 1
        }

        if i == "p" {
            pCount += 1
        }
    }

    return yCount == pCount ? true : false
}

// 다른 사람 풀이

func 문자열내p와y다른풀이(_ s:String) -> Bool
{
    let string = s.lowercased()
    // 요렇게도 비교할 수 있구나. 배워갑뉘다.
    // 그리고 단순 비교연산자 return 값이 Bool 타입이라 삼항연산자 안써도 된다
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count

    // 필터로 하는 방법도 있다 !!
    return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
}
