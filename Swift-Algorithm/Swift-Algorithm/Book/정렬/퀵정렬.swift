//
//  퀵정렬.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*
 3. 퀵정렬 : 가장 많이 사용되는 정렬알고리즘
 기준 데이터를 설정하고 그 기준보다 큰 데이터와 작은 데이터의 위치를 바꾼다.
 => 기준을 설정한 다음 큰 수와 작은 수를 교환한 후 리스트를 반으로 나누는 방식으로 동작

 퀵 정렬에서는 피벗이 사용된다.
 큰 숫자와 작은 숫자를 교환할 떄, 교환하기 위한 기준을 바로 피벗이라고 표현한다.
 퀵 정렬을 수행하기 전에는 피벗을 어떻게 설정할 것인지 미리 명시해야 한다.
 대표적인 분할 방식인 호어 분할 방식을 기준으로 설명

 호어 분할 방식에서는 다음과 같은 규칙에 따라서 피벗을 설정한다.
 => 리스트에서 첫번째 데이터를 피벗으로 정한다.

 이와 같이 피벗을 설정한 뒤에는 왼쪽에서부터 피벗보다 큰 데이터를 찾고,
 오른쪽에서부터 피벗보다 작은 데이터를 찾는다.

 그다음 큰 데이터와 작은 데이터의 위치를 서로 교환
 이 과정을 반복하면 피벗에 대하여 정렬이 수행된다.

 1 ) 첫번째 데이터가 피벗
 2 ) 왼쪽에서 부터 피벗보다 큰 수 , 오른쪽에서 부터는 피벗보다 작은 수 교환
 3 ) 두 수가 엇갈리게 될 경우에, 작은 수와 피벗의 위치를 바꾼다.
 4 ) 피벗을 기준으로 왼쪽엔 피벗보다 작은 수들, 오른쪽엔 큰 수들이 위치한다. : 분할
 5 ) 이 상태에서 왼쪽 리스트와 오른쪽 리스트를 개별적으로 정렬 => 각 양쪽 리스트에 대해 재귀
  - 정렬이 끝나는 종료 조건은 ? 현재 리스트의 데이터 개수가 1개 일 경우

 */


func 퀵정렬() {

    var quickArray = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]

    func quickSort(array: [Int], start: Int, end: Int) {
        if start >= end {
            // 원소가 1개인 경우 종료
            return
        }

        var pivot = start // pivot은 첫 번째 원소
        var left = start + 1
        var right = end

        while left <= right {
            // pivot 보다 큰 데이터를 찾을 때까지 반복
            while left <= end && quickArray[left] <= quickArray[pivot] {
                left += 1
            }

            // pivot 보다 작은 데이터 찾을 때까지 반복

            while right > start && quickArray[right] >= quickArray[pivot] {
                right -= 1
            }

            if left > right {
                // 엇갈렸다면 작은 데이터와 피벗을 교체
                quickArray.swapAt(right, pivot)
            } else {
                // 엇갈리지 않았다면 작은 데이터와 큰 데이터를 교체
                quickArray.swapAt(left, right)
            }
        }

        // 분할 이후 왼쪽과 오른쪽에 각각 재귀적으로 정렬 수행
        quickSort(array: quickArray, start: start, end: right-1)
        quickSort(array: quickArray, start: right+1, end: end)

    }

    quickSort(array: quickArray, start: 0, end: quickArray.count-1)
}

/*
 시간 복잡도 ? 평균 O(NlogN)

 */
