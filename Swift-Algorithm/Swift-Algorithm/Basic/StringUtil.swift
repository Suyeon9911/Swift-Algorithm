//
//  StringUtil.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

extension String {
    func getASCII(char: String) -> UInt8? {
        return Character(char).asciiValue
    }
}
