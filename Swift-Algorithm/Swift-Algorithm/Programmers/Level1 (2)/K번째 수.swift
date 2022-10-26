//
//  K번째 수.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

// 정렬문제

/*
 배열의 i부터 j 번째 숫자까지 자르고 정렬했을 때 k번째 있는 수 구하기


 */
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var sortArray: [Int] = []
    var resultArray: [Int] = []

    for command in commands {
        var i = command[0]
        var j = command[1]
        var k = command[2]

        for index in i...j {
            sortArray.append(array[index-1])
        }

        sortArray.sort()

        resultArray.append(sortArray[k-1])
        sortArray.removeAll()
    }

    return resultArray
}

func K번쨰수간단풀이(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({
        return array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1]
    })

}
