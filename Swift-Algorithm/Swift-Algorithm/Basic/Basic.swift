//
//  Basic.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/19.
//

import Foundation

// 기본 입력 받기

func input() -> String {
    guard let value = readLine() else {
        return ""
    }
    return value
}

var value = readLine()!
var intValue = Int(readLine()!)!

func changeInt(value: String) -> Int {
    guard let value = Int(value) else {
        return 0
    }

    return value
}

// 공백있는 숫자 배열로 받기 1 2 3 4 5

// return - [SubString]
var nums = readLine()!.split(separator: " ").map {Int($0)!}

// components - return: [String] -> import Foundation 필수
var nums1 = readLine()!.components(separatedBy: " ").map {Int($0)!}

// string 값으로 받은 값을 array로 자른다.
let array = value.components(separatedBy: " ")


// Int
var intArray = Array(readLine()!).map {Int(String($0))!}

// String
var stringArray = Array(readLine()!).map {String($0)}

/*
 입력 초과 날 경우에는 fileIO 사용
 */
// FileIO, 입력받으면서 리스트에 바로 추가하기

//let file = FileIO()
//
//array.append((file.readInt(), file.readInt()))
//
//
// FileIO
//let nums = [file.readInt(), file.readInt()]
