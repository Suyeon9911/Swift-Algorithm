//
//  음양더하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/25.
//

import Foundation

func 음양더하기(_ absolutes:[Int], _ signs:[Bool]) -> Int {

    var realNumArray: [Int] = []
    // 실제 숫자 배열을 만든다

    for i in 0..<signs.count {
        // ture 일 경우 양수이기 때문에 그냥 append 해주고 음수일경우 -를 붙여서 append 해준다
        if signs[i] {
            realNumArray.append(absolutes[i])
        } else {
            realNumArray.append(-absolutes[i])
        }
    }
    return realNumArray.reduce(0,+)
}
