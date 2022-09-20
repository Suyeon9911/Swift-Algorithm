//
//  Practice.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/19.
//

import Foundation

/*
 Swift 구현 연습 - 프로그래머스 레벨 1
 53문제 전부 빠르게 풀어보기 - 정답률 높은 순서대로
 */

func evenAndOdd(_ num:Int) -> String {
    var result: String = ""

    if num % 2 == 0 {
        result = "Even"
    } else {
        result = "Odd"
    }
    return result
}

// 삼항연산자 사용

func solution2(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
}


