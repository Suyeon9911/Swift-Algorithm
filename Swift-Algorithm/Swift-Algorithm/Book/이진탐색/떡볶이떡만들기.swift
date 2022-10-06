//
//  떡볶이떡만들기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*

 떡 자르기 : 절단기 높이에 맞게 , 손님이 요청한 떡의 길이를 만족하는 절단기 높이의 최댓값
 4 6 -> 떡의 개수, 손님이 요청한 길이
 19 15 10 17 -> 개별 떡의 길이

 15cm는 되어야 4 0 0 2 로 6을 만족할 수 있다.

 => 해설 : 전형적인 이진탐색 문제 , 파라메트릭 서치 유형
 최적화 문제 -> 결정문제로 바꾸어 해결 (예 아니오)
 : 원하는 조건을 만족하는 가장 알맞는 값을 찾는 문제

 범위 내에서 조건을 만족하는 가장 큰 값을 찾으라는 최적화 문제 => 이진탐색으로 결정 문제를 해결하면서
 범위를 좁혀간다.

 해결 : 적절한 높이를 찾을 때까지 절단기 높이를 반복해서 조정 => 현재 이 높이로 자르면 조건을 만족할 수 있는가?
 예, 아니오 에 따라서 탐색 범위 좁혀간다. + 이진탐색의 원리로

 절단기의 높이가 1부터 10억까지임 -> 큰 수를 보면 이진탐색을 떠올리자
 절단기의 높이가 한정적이었다면 순차탐색도 가능하지만, 10억까지므로 순차탐색의 경우 시간초과를 받는다.

 떡의 개수 n이 최대 100만 개 이므로 이진탐색으로 절단기의 높이 h를 바꾸면서
 바꿀 때마다 모든 떡을 체크 - 최대 3000만 번 연산으로 가능

 => 이진탐색 반복, 중간값 최적화 , 갱신

 파라메트릭 서치 문제의 경우 재귀보다는 반복문이 깔끔하다.

 */

func 떡볶이떡만들기() {

    let dduck = readLine()!.split(separator: " ").map { Int(String($0))! }

    let dduckCount = dduck[0]
    let needHeight = dduck[1]

    let dduckArray = readLine()!.split(separator: " ").map { Int(String($0))! }

    // 이진탐색을 위한 시작점과 끝점 설정

    var start: Int = 0
    var end = dduckArray.max()! // 떡 길이중 가장 긴거

    // 이진탐색 수행 반복

    var result = 0

    while start <= end {
        var total = 0

        var mid = (start + end) / 2

        for i in dduckArray {
            if i > mid {
                // 중간 값보다 떡의 길이가 길면 자른다.
                total += i - mid // 자른 길이를 total 에 더해준다.
            }
        }

        // 떡의 양이 부족한 경우 더 많이 자르기 -> 왼쪽부분 탐색 / 끝점 줄이기
        if total < needHeight {
            end = mid-1
        } else {
            // 떡의 양이 충분한 경우 -> 덜자르기 오른쪽 탐색 / 시작점 늘리기
            // 최대한 덜 잘랐을 때가 정답 이므로 result에 저장
            result = mid
            start = mid+1
        }
    }

    print(result)
}
