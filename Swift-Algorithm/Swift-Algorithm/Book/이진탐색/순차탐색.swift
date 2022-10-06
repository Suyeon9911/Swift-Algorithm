//
//  순차탐색.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*
 순차 탐색 이란 ? 리스트 안에 있는 특정한 데이터를 찾기 위해 앞에서부터 떼이터를 하나씩 차례대로 확인
 O(n)
 */

func 순차탐색() {

    var answer = 0

    func sequentialSearch(n: Int, target: Int, array: [Int]) {

        for i in 0..<n {
            // 원소를 하나씩 확인하며
            if array[i] == target {
                // 찾고자하는 원소와 동일한 경우
                answer = i+1 // 현재 위치 반환
            }
        }
    }

    print(answer)
}
