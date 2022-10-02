//
//  시각.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/26.
//

import Foundation

func 시각() {
    let hour = Int(readLine()!)!

    var count = 0

    for i in 0...hour {
        for j in 0..<60 {
            for k in 0..<60 {
                let time = String(i) + String(j) + String(k)
                if time.contains("3") {
                    count += 1
                }
            }
        }
    }

    print(count)
}
