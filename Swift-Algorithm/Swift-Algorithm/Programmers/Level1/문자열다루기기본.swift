//
//  문자열다루기기본.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

func 문자열다루기기본(_ s:String) -> Bool {

    let stringArray = Array(s)
    let numberArray = Array(0...9).map { String($0) }

    var result: Bool = false

    // 문제 조건 잘 확인하기 4 또는 6 이어야함
    for i in 0..<s.count {
        if numberArray.contains(String(stringArray[i])) && (s.count == 4 || s.count == 6 ) {
            result = true
        } else {
            result = false
            break
        }
    }

    return result
}

// 내가 생각한 풀이 : 일단 배열로 받아서 0~9까지 스트링 배열이랑 비교하기 ㅎㅎ..

func solution2(_ s:String) -> Bool {
    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
}

// Int로 형변환 했을때 nil 이 나오는구나 헤헤..

func solution22(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        if Int(s) != nil {
            return true
        }
    }
    return false
}
