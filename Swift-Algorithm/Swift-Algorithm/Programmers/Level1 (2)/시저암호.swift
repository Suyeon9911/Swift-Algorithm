//
//  시저암호.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/21.
//

import Foundation

/*

 */

func 시저암호(_ s:String, _ n:Int) -> String {

    let upperString = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    let lowerString = Array("abcdefghijklmnopqrstuvwxyz")
    let inputString = Array(s)
    var result = ""

    for i in 0..<inputString.count {
        if upperString.contains(inputString[i]) {
            var newIndex = i + n

            if newIndex > 25 {
                newIndex = newIndex - 26
            }

            result.append(upperString[newIndex])
        } else if lowerString.contains(inputString[i]) {
            var newIndex = i + n

            if newIndex > 25 {
                newIndex = newIndex - 26
            }

            result.append(lowerString[newIndex])
        } else {
            // 공백일 경우
            result.append(" ")
        }
    }
    return result
}
// 잘못 풀었다 히히 ..


func 시저암호2(_ s:String, _ n:Int) -> String {

    let upperString = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    let lowerString = Array("abcdefghijklmnopqrstuvwxyz")
    let inputString = Array(s)
    var result = ""

    for i in s {
        if i == " " {
            result.append(" ")
        } else if lowerString.contains(i) {
            var newIndex = (lowerString.firstIndex(of: i)! + n) % 26

            result.append(String(lowerString[newIndex]))
        } else {
            var newIndex = (upperString.firstIndex(of: i)! + n )  % 26
            result.append(String(upperString[newIndex]))
        }
    }

    return result
}

// unicode로 푸는 방법

func 시저암호유니코드(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)

        switch code {
        case 65...90:
            code = (code + n - 65) % 26 + 65
        case 97...122:
            code = (code + n - 97) % 26 + 97
        default:
            break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

func 시저암호다른풀이(_ s:String, _ n:Int) -> String {
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}
