//
//  나머지가1이되는수찾기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 나머지가1이되는수(_ n:Int) -> Int {
    var result: Int = 0

    // 1부터 n까지 돌아가면서 n을 나눈 나머지가 1이 되는 작은 자연수 이므로 바로 나오면
    // 그게 제일 작은수가 되니까 바로 break 걸고 출력
    for i in 1...n {
        if n % i == 1 {
            result = i
            break
        }
    }
    return result
}

func 나머지가1이되는수while(_ n:Int) -> Int {
    var count = 1
    // 범위 안정하고 while 문써도 된다
    while true {
        if (n % count) == 1 {
            break
        }
        count += 1
    }

    return count
}


func 다른풀이222(_ n:Int) -> Int {
    for i in 1..<n {
        if n % i == 1 { return i }
    }
    return n-1
}
