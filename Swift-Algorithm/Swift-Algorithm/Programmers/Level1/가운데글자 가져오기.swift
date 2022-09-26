//
//  가운데글자 가져오기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/25.
//

import Foundation

func 가운데글자가져오기(_ s:String) -> String {

    var answer: String = ""

    if s.count % 2 == 0 {
        // 짝수일경우 -> string에 나누기 2 해서 -1 한 인덱스 부터 ~ 나누기 2한 부분
        // 즉 4개 일경우 나누기 2 한뒤 -1한 1번 인덱스 부터 +1
        let targetIndex = s.count / 2 - 1

        answer = String(s[s.index(s.startIndex, offsetBy: targetIndex)...s.index(s.startIndex, offsetBy: targetIndex + 1)])

    } else {
        // 홀수일 경우 stirng의 길이 에서 나누기 2한 몫
        let index = s.count / 2 // 아마 5에서 2로 나누면 몫이 2 니까 인덱스가 2번
        answer = String(Array(s)[index])
    }

    return answer
}

// 다른 사람 풀이 필수.. ㅜ ㅜ

func 가운데글자(_ s:String) -> String {

    return String(s[s.index(s.startIndex,offsetBy: (s.count-1)/2)...s.index(s.startIndex, offsetBy: s.count/2)])
    // 간단하게 홀수일경우 5-1/2 = 2번째 ~ 5/2 = 2번째  같으니까 1개만 출력되고 짝수일경우엔 4-1/2 1번째부터 ~ 4/2 2번째까지 2개 출력된 !!
}

func 가운데글자풀이2(_ s:String) -> String {
    // 배열로 바꿔서 인덱스로 접근하는 방법 ! 
    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    } else {
        return String(Array(s)[s.count/2])
    }
}
