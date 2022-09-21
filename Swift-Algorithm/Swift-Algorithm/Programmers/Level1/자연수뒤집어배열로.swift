//
//  자연수뒤집어배열로.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/21.
//

import Foundation

func 자연수뒤집어배열로(_ n:Int64) -> [Int] {
    return Array(String(n)).reversed().map { Int(String($0))! }
    // let arr = String(n).compactMap { Int(String($0)) } return arr.reversed()
    // 그냥 map과 compactMap의 차이 알아보기
}

