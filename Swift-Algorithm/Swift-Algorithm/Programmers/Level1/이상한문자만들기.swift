//
//  이상한문자만들기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/13.
//

import Foundation

func 이상한문자만들기(_ s:String) -> String {

    var stringArray:[String] = s.components(separatedBy: " ")

    for i in 0..<stringArray.count {
        var array:[String] = []

        for s in stringArray[i] {
            array.append(String(s))
        }

        for j in 0..<array.count {
            if j % 2 == 0 {
                array[j] = String(array[j].uppercased())
            } else {
                array[j] = String(array[j].lowercased())
            }
        }
        stringArray[i] = array.joined()
    }

    return stringArray.joined(separator: " ")
}

func 이상한문자다른풀이(_ s:String) -> String {
    let a = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }

    // enumerated 쓰면 index는 offset으로 value는 element로

    return a.map{ $0.map { $0 }.joined() }.joined(separator: " ")
}


func 이상한문자다른풀이2(_ s:String) -> String {
    var ans = ""
    var index = 0

    for char in s {
        if char != " " {
            if index % 2 == 0 {
                ans += String(char).uppercased()
            } else {
                ans += String(char).lowercased()
            }
            index += 1
        } else {
            ans += " "
            index = 0
        }
    }

    return ans
}
// 아예 새로운 string을 만드는 방법도 있당. 공백 나올때마다 index는 0으로 초기화 된다.

func 이상한문자다른풀이3(_ s:String) -> String {
    var index: Int = 0
    var answer: String = ""

    for (i, c) in s.enumerated() {
        let char = String(c)
        if c == " " {
            index = (i%2 == 0) ? 1 : 0
            answer += char
            continue;
        }
        answer += ((i+index)%2 == 0) ? char.uppercased() : char.lowercased()
    }
    return answer
}
