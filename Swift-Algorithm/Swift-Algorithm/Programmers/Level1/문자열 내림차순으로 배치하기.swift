//
//  문자열 내림차순으로 배치하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/02.
//

import Foundation

// 아스키코드로 바꾸는 방법을 알야하는데. 이거 정확히 공부하자
//func 문자열내림차순(_ s:String) -> String {
//
//    // 아스키코드로 바꿔서 정렬
//    var newStringArray = Array(s)
//    var ascii = newStringArray.map { Int(UnicodeScalarType($0))! }
//
//    ascii.sort()
//
//    return ""
//}
//

// 문제 다시 읽어보니까 대문자는 소문자보다 작은걸로 간주한다네요..

func 문자열내림차순(_ s: String) -> String {
    return String(s.sorted { $0 > $1 })
}

func 문자열내림차순2(_ s: String) -> String {

    var result: String = ""

    for i in 0..<s.count {
        // 내림차순으로 정렬하고 싶은 경우 > 요거 !
        result += String(s.sorted(by: >)[i])
    }

    return result
}
