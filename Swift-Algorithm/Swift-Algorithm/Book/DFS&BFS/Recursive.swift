//
//  Recursive.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// 재귀 대표  : factorial

func factorial(_ num: Int) -> Int {
    if num <= 1 {
        // 재귀 탈출 조건 명시 해주기 !
        return 1
    }
    return ( num * factorial(num - 1))
}

// 우리가 함수를 호출하는 것은 stack 처럼 관리가 되기 때문에 재귀함수도 같음
// 가장 마지막에 호출됐던 factorial(1) 부터 자신의 값을 반환하며 맨 처음 호출됐던 factorial(4) 까지
// Stack 쌓은 모든 함수가 return

// 시간복잡도 : O(n) -> n-1번의 factorial 함수를 호출해서 곱셈함. / 반복문을 n-1번 호출한 것과 동일
// 공간복잡도 : 함수이기 때문에 재귀호출될때마다 stack에 저장됨. 함수가 10번 재귀 호출되면, 파라미터 상수 num이 10개 생성되어 각각 메모리에 올라감.
// 입력 n에 따라 n-1 만큼 변수가 생성되니까 O(n)
