//
//  행렬의덧셈.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {

    var answer: [[Int]] = []

    for i in 0..<arr1.count {
        // 행만큼 반복문을 돈다.
        answer.append([])
        // 행에서 새로운 배열을 추가해주세용
        for j in 0..<arr1[i].count {
            // 그 행에 해당하는 열을 돌면서 그 행에 해당하는 배열에 append 해줍니다.
            answer[i].append(arr1[i][j] + arr2[i][j])
        }
    }

    return answer
}

// 내가 원래 하려던 방식

func 행렬덧셈2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {

    var answer: [[Int]] = Array(repeating: Array(repeating: 0, count:arr1[0].count), count:arr1.count)

    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            answer[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return answer
}

func 행렬덧셈3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {

    // 그냥 단순하게 arr1에다가 더해줄수도 있구나
    var answer: [[Int]] = arr1
    for i in 0...arr1.count-1 {
        for j in 0...arr1[i].count-1 {
            answer[i][j] += arr2[i][j]
        }
    }
    return answer
}

func 행렬덧셈4(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    // 고차함수 활용 arr1, arr2를 zip으로 합쳐주면 같은 인덱스 배열끼리 짝지게된다
    // 예를 들어 [[1,2],[3,4]]   [[5,6],[7,8]] 일경우
    // ([1,2],[5,6])  ([3,4],[7,8]) 처럼 배열의 첫번쨰 끼리 합쳐지게 되고
    // 다시한번 zip($0,$1) 을 해주면 만들어진 배열의 첫번째끼리 묶인다.
    // (1,5)(2,6)(3,7)(4,8) -> 각각 map 으로 더해준다.
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}
