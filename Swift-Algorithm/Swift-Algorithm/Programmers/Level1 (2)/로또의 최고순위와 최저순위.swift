//
//  로또의 최고순위와 최저순위.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/11/03.
//

import Foundation

func 로또(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

    var sameNumber = 0
    var zeroCount = 0
    var answer:[Int] = []

    for i in lottos {
        if win_nums.contains(i) {
            // 당첨번호에 포함되어 있으면
            sameNumber += 1
        }

        if i == 0 {
            zeroCount += 1
        }
    }

    // 0인 경우 경우의 수 따지기
    // 0이 1개면 -> +1 or 0, 0이 두개면 0, 1, 2  0 이 3개면 0,1,2,3 ..
    // 0의 개수 +1 만큼의 경우의 수 가 생김

    answer.append(sameNumber) // 0 이 있음에도 아무것도 못맞춘 경우

    for i in 0..<zeroCount {
        // 0이 있는데 1개라도 맞췄을 경우??
        let i = i+1
        answer.append(sameNumber+i)
    }

    for i in 0..<answer.count {
        if answer[i] == 0 || answer[i] == 1 {
            answer[i] = 6
        } else if answer[i] == 2 {
            answer[i] = 5
        } else if answer[i] == 3 {
            answer[i] = 4
        } else if answer[i] == 4 {
            answer[i] = 3
        } else if answer[i] == 5 {
            answer[i] = 2
        } else {
            answer[i] = 1
        }
    }

    return [answer.min()!, answer.max()!]
}

func 로또간단풀이(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

    let zeroCount = lottos.filter { $0 == 0 }.count // 0 몇개인지 세기 !
    let winCount: Int = win_nums.filter { lottos.contains($0) }.count


    return [min(7-winCount-zeroCount,6), min(7-winCount,6)]

    // return [(lottos.count + 1) - lottos.filter { winNums.contains($0) || $0 == 0 }.count, (lottos.count + 1) - lottos.filter(winNums.contains).count].map { $0 > 6 ? $0 - 1 : $0 }
}

func 로또다른풀이(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let mine = Set(lottos)
    let winner = Set(win_nums)
    let score = mine.intersection(winner).count
    let joker = lottos.filter { ($0 == 0) }.count
    let ranking = [6, 6, 5, 4, 3, 2, 1] // index에 대응한거 좋다 !

    return [ranking[score + joker], ranking[score]]
}

// 아니면 따로 메서드 만들어서 ! 순위 출력하기
func getRanking(_ num: Int) -> Int {
    switch num {
    case 6: return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}

/*
 이 문제의 경우 모든 경우의 수를 안따지고, 최고순위는 0의 개수만큼 맞췄을 때니까 더 간단하게 풀어낼 수 있다.
 최소는 딱 공개된 숫자에서 맞춘 경우만 세면 된다/
 
 return [ getRanking(ans + zero), getRanking(ans)]

 */
