//
//  수박수박수박수박수박수? .swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 수박수박(_ n:Int) -> String {

    var answer: String = ""

    for i in 1...n {
        answer += i % 2 == 0 ? "박" : "수"
    }

    return answer
}

func 수박수맵활용(_ n:Int) -> String {
    return (0..<n).map{($0 % 2 == 0 ? "수":"박")}.reduce("", +)
}
