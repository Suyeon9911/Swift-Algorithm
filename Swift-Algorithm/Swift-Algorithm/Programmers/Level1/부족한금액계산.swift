//
//  부족한금액계산.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/05.
//

import Foundation

func 부족한금액계산(_ price:Int, _ money:Int, _ count:Int) -> Int64 {

    var answer: Int64 = 0
    var needMoney: Int = 0

    // count 만큼 반복문을 돌리면서 price를 올린다.
    // 총 얼마가 필요한지 계산 후에 갖고 있는 돈을 뺀다. 1000원 필요 - 800원 가짐
    // 200원 부족 -> return
    // 음수가 나올 경우 0을 return 한다.

    for i in 1...count {
        needMoney += price*i
    }

    if needMoney > money {
        answer = Int64(needMoney - money)
    } else {
        answer = 0
    }

    return answer
}
