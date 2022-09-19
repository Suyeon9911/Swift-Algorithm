//
//  A+B.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/19.
//

import Foundation

//let value = readLine()! // 입력 값 : 옵셔널 . 언래핑

// string 값으로 받은 값을 array로 자른다.
//let array = value.components(separatedBy: " ")
//
//print("\(Int(array[0])! + Int(array[1])!)")

// 위 코드의 문제점 ?
// iOS - MVC 패턴 Model View Controller
// view

//func inputView() -> String? {
//    return readLine()
//}

func inputView() -> String {
    guard let value = readLine() else {
        return ""
    }
    return value
}

func outputView(value: Any) {
    print("\(value)")
}

// controller

func stringToArray(value: String) -> [String] {
    return value.components(separatedBy: " ")
}

func stringToInt(value: String) -> Int {
    guard let value = Int(value) else {
        return 0
    }
    return value
}

func sum(first: Int, second: Int) -> Int {
    return first + second
}

// model

struct Model {
    let first: Int
    let second: Int
}


func main() {
    // 강제 언래핑 안쓰기 : guard let 쓰자
    // view
    let inputValue = inputView()

    // controller
    let array = stringToArray(value: inputValue)

    let first = stringToInt(value: array[0])
    let second = stringToInt(value: array[1])

    // Model
    let model = Model(first: first, second: second)

    // controller
    let result = sum(first: model.first, second: model.second)

    // view
    outputView(value: result)

    // model과 view 분리 .
}


// main()
