//
//  문자열을 정수로 바꾸기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 문자열을정수로(_ s:String) -> Int {
    var answer: Int = 0
    var string = Array(String(s))

    if string[0] == "-" {
        string.remove(at: 0)
        answer = -Int(string.map { String($0) }.joined())!
    } else if string[0] == "+" {
        string.remove(at: 0)
        answer = Int(string.map { String($0) }.joined())!
    } else {
        answer = Int(string.map { String($0) }.joined())!
    }

    return answer
}

// 진짜 바보가튼 코드지만 머 .. 이렇게 해봤습니당 !
// 근데 그냥 Int(s) 가 되나보네요... ㅋ

func 다른푸리(_ s:String) -> Int {
    if let num = Int(s) {
        return num
    }

    return 0
}
