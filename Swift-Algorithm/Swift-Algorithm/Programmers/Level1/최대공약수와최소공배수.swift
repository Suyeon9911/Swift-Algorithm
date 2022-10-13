//
//  최대공약수와최소공배수.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/07.
//

import Foundation

/*

 최대 공약수를 구할때 , 하나씩 다 구하면 수가 클 경우에 시간초과.
 소인수분해, 유클리드 호제법과 같은 효율적인 알고리즘을 이용하여 풀어야함.

 유클리드 호제법 : 큰 수에서 작은 수로 나누어 나머지 구하고 나눈 몫을 또 계속 나누어 나머지가 0이 될때까지 반복한다는 원리

 20 / 16 = 1(나머지 4)
 16 / 4 = 4(나머지 0), 연산 종료 해당 식에서의 몫이 바로 최대공약수

 192 / 72 = 2(나머지 48)
 72 / 48 = 1(나머지 24)
 48 / 24 = 2(나머지 0)

 그러면 최소 공배수는 ?? 최대공약수를 활용한다.

 최소공배수 = 0이 아닌 자연수들의 곱 / 최대공약수

 8의 약수 : 1, 2, 4, 8
 10의 약수 : 1, 2, 5, 10

 8과 10의 최대공약수(gcd) = 2

 8과 10의 최소공배수(lcm) = 8 * 10 / 2 = 80 / 2 = 40

 */



func 최대최소(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b

    // a를 b로 나눈 나머지가 0이 아니라면
    if r != 0 {
        return gcd(b, r) // 큰 수를 작은수로 나누는 과정을 반복
    } else {
        // 0이라면 b가 최대공약수
        return b
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    // 최대 공약수를 활용하여 최소공배수 구하기
    let r = a * b / gcd(a, b)
    return r
}

func 시간초과(_ n:Int, _ m:Int) -> [Int] {

    var answer: [Int] = []

    // n과 m의 최대공약수, 최소공배수 구하기
    // n의 약수, m의 약수 중에서 겹치는데 최대인거

    var divisionArray: [Int] = []

    for i in 1...m {
        if (n % i == 0) && (m % i == 0) {
            divisionArray.append(i)
        }
    }

    let maxDivision = divisionArray.max()!

    // n의 배수, m의 배수 중에서 겹치는데 최소인거

    var minMulti = 0
    var count = 1

    while true {
        var multiM = m * count
        var multiN = n * count

        if multiM == multiN {
            minMulti = count
            break
        }

        count += 1
    }

    return [maxDivision, minMulti]
}

func 최대최소다른풀이(_ n:Int, _ m:Int) -> [Int] {

    var first: [Int] = []

    // 내가 한 방식대로 일단 최대공약수를 구하고, 그걸 이용해서 최소공배수구하기

    for index in 1...n {
        if n % index == 0  && m % index == 0 {
            first.append(index)
        }
    }

    let maxValue: Int = first[first.count-1]

    return [maxValue ,(n * m)/maxValue ]
}

func 다른풀이랑내풀이합쳐서(_ n:Int, _ m:Int) -> [Int] {
    // n과 m의 최대공약수, 최소공배수 구하기
    // n의 약수, m의 약수 중에서 겹치는데 최대인거

    var divisionArray: [Int] = []

    for i in 1...m {
        if (n % i == 0) && (m % i == 0) {
            divisionArray.append(i)
        }
    }

    let maxDivision = divisionArray.max()!

    return [maxDivision, (n * m) / maxDivision]
}
