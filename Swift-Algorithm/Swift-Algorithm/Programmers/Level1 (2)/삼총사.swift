//
//  삼총사.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

/*
 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사
 삼총사를 만들 수 있는 경우의 수?
 */

func 삼총사(_ number:[Int]) -> Int {

    var result = 0

    for i in 0..<number.count {
        for j in i+1..<number.count {
            for k in j+1..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }

    return result
}

// 조합 함수 만들어서 써보기
func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()

    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            combi(i + 1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}

func 삼총사조합(_ number:[Int]) -> Int {
    var combi = combination(number,3)
    var cnt = 0
    for i in combi {
        if i.reduce(0,+) == 0 {
            cnt += 1
        }
    }
    return cnt
}
