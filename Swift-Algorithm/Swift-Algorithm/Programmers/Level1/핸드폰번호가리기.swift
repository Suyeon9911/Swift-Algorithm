//
//  핸드폰번호가리기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 핸드폰번호가리기(_ phone_number:String) -> String {

    var resultNumber = String(repeating: "*", count: phone_number.count - 4)
    resultNumber += phone_number.suffix(4)

    return resultNumber
}


func 핸드폰번호가리기바로return(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}
