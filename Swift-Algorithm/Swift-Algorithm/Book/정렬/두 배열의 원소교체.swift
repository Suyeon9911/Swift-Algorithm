//
//  두 배열의 원소교체.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*

 2개의 배열 a와 b -> n개의 원소 , k 번의 바꿔치기 수행가능
 k번의 바꿔치기 이후 배열 a의 합의 최댓값

 5 3
 1 2 5 4 3
 5 5 6 6 5

 1 -> 6
 2 -> 6
 3 -> 5

 a의 가장 작은 수와
 b의 가장 큰수를 바꾸는 작업 k번 수행

 단, a의 가장 작은 수가 b의 가장 큰 수 보다는 작아야 바꾸는 의미가 있겠지 ?
 a는 오름차순
 b는 내림차순

 첫번째 인덱스 부터 비교하면서 a가 b보다 작을때 바꾼다.

 */


func 두배열의원소교체() {

    let nk = readLine()!.split(separator: " ").map { Int(String($0))! }

    let n = nk[0]
    let k = nk[1]

    var a = readLine()!.split(separator: " ").map { Int(String($0))! }
    var b = readLine()!.split(separator: " ").map { Int(String($0))! }

    a.sort()
    b.sort(by: >)

    // 첫번째 인덱스부터 k번 비교하기

    for i in 0..<k {
        if a[i] < b[i] {
            // a가 b보다 작은경우
            let temp = a[i]
            a[i] = b[i]
            b[i] = temp
        } else {
            // a가 크거나 같을 때 반복문 탈출
            break
        }
    }

    print(a.reduce(0,+))
}
