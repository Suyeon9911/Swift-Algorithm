//
//  최댓값과 최솟값.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

func solution(_ s:String) -> String {
    var string = s.components(separatedBy: " ").map { Int($0)! }
    var result: [String] = []

    string.sort()
    result.append(String(string[0]))
    result.append(String(string[string.count-1]))

    // return String(arr[0]) + " " + String(arr[arr.count - 1])
    return result.joined(separator: " ")
}
