//
//  3진법구하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/13.
//

import Foundation

func 삼진법구하기(_ n:Int) -> Int {

    var three: String = String(n, radix: 3)

    // 3진법으로 변환 후 reverse 하기
    var threeArray: [String] = []

    for i in three {
        threeArray.append(String(i))
    }

    threeArray = threeArray.reversed()
    three = threeArray.joined()

    // 3진법을 다시 10진법으로 변환

    var ten : Int = Int(three, radix: 3)!


    return ten
}


func 삼진법다른풀이(_ n:Int) -> Int {

    // String도 바로 reversed() 가 된다.
    let flipToThree = String(n,radix: 3)

    let answer = Int(String(flipToThree.reversed()),radix:3)!
    
    return answer

}
