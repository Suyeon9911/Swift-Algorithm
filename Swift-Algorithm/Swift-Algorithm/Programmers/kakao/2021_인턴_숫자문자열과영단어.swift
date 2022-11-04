//
//  2021_인턴_숫자문자열과영단어.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/28.
//

import Foundation

// 1478 → "one4seveneight"

func 숫자문자열과영단어(_ s:String) -> Int {

    var s: String = s
    let english = ["zero","one","two","three","four","five","six","seven","eight","nine"]

    for e in 0..<english.count {
        if s.contains(english[e]) {
            s = s.replacingOccurrences(of: english[e], with: String(e))
        }
    }

    return Int(s)!
}
