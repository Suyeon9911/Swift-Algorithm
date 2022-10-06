//
//  이진탐색.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*

 이진탐색 : 반으로 쪼개면서 탐색하기
 -> 배열 내부의 데이터가 정렬되어 있어야만 사용할 수 있는 알고리즘
 -> 탐색 범위를 절반 씩 좁혀가며 데이터를 탐색

 이진탐색은 위치를 나타내는 변수 3개를 사용하는데
 탐색하고자 하는 범위의 시작점, 끝점, 중간점
 => 찾으려는 데이터와 중간점 위치에 있는 데이터를 반복적으로 비교해서 원하는 데이터를 찾는다.
 전체 시간복잡도 O(logN)

 구현 방법에는 2가지가 있는데
 1. 재귀
 2. 반복문

 */

func 이진탐색구현1번쨰() {

    var answer = -1

    func binarySearch(array: [Int], target: Int, start: Int, end: Int) {
        if start > end {
            // 시작점이 끝점이 지나가면 탐색이 끝났는데 데이터가 없는 상황임
            answer = -1
        }

        var middle = (start + end) / 2

        // 중간점에서 데이터를 찾은 경우
        if array[middle] == target {
            answer = middle
        } else if array[middle] > target {
            // 중간점의 값보다 찾고자 하는 값이 작은 경우 왼쪽만 보면된다.
            binarySearch(array: array, target: target, start: start, end: middle-1)
        } else {
            // 중간점이 값보다 찾고자하는 값이 큰 경우는 오른쪽만 보면된다.
            binarySearch(array: array, target: target, start: middle+1, end: end)
        }
    }

    // 데이터가 없을 경우 -1
}

func 이진탐색구현2번째() {

    var answer = -1

    func binarySearch(_ array: [Int],_ target: Int,_ start: Int,_ end: Int) {

        var start = start
        var end = end

        while start <= end {
            var mid = (start + end) / 2

            if array[mid] == target {
                answer = mid
            } else if array[mid] > target {
                end = mid-1
            } else {
                start = mid+1
            }
        }
    }
}

// 외우기 : 코딩테스트에 자주 나온다.

