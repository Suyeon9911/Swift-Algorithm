//
//  JadenCase 문자열 만들기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/11/03.
//

import Foundation

func JadenCase(_ s:String) -> String {
    var array = s.components(separatedBy: " ").map { String($0) }

    for i in 0..<array.count {
        // 첫번째 문자를 Int로 형변환 - nil이 아닐 경우 첫번째가 숫자
        if Int(array[i].prefix(1)) != nil {
            array[i] = array[i].lowercased()
        } else {
            array[i] = array[i].capitalized
        }
    }

    return array.joined(separator: " ")
}

func jaden다른풀이(_ s:String) -> String {

    let words = s.components(separatedBy: " ")
    var charaters = Array(repeating: [String](), count: words.count)
    var answer = Array(repeating: String(), count: words.count)
    for w in 0..<words.count {
        // 전부 소문자로 바꾸고. 첫번째만 대문자로 바꾸기. 배열로 접근
        charaters[w] = words[w].map{String($0).lowercased()}
        if charaters[w] != [] {
        charaters[w][0] = charaters[w][0].uppercased()
        }
        answer[w] = charaters[w].joined(separator: "")
    }

    return answer.joined(separator: " ")
}

