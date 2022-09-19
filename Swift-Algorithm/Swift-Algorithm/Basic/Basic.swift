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


// Array
// map, filter 가 유용하다

// 빈 배열 만들기
var array1: [Int] = []
var array2 = [Int]()
var array3: Array<Int> = []

// 임의의 데이터 넣어서 만들기

var array4 = Array(1...5)

// 크기가 정해진 배열

var array5 = Array(repeating: 0, count: 3)

// 2차원 배열 만들기
let matrix = [[Int]]()
var arr: [[Int]] = Array(repeating: Array(repeating: 1, count: 5), count: 3)

// 다룰때는 arr[i][j]

// 배열 거꾸로 출력
let result = array4.reversed()

// 배열 정렬하기 - defalut 오름차순
let result2 = array4.sorted()

// 내림차순으로 하고 싶을 경우

let result3 = array4.sorted(by: >)

// 배열 다룰 떄 가장 중요한 3가지 : map, filter, reduce
// 1. map

var string = ["1","2","3","4"]
let stringResult = string.map { Int($0)! } // 각 원소 전부를 Int로 맵핑

// 2. filter

var intArray2: [Int] = [1,2,3,4]

let arrayResult = intArray2.filter { $0 % 2 == 0 } // [2,4] 조건에 맞는 수만 뽑아냄

// 3. reduce

let arrayResult2 = intArray2.reduce(0, +) // 숫자 합이 나타남 = 10. 문자열 합치기도 가능

// String, Substring, Index 다루기


let secondIndex = string.index(after: string.startIndex) // 1
let second = string[secondIndex] // 2

let endIndex = string.index(before: string.endIndex) // 3

// n번쨰 문자 index 구하기
let n: Int = 3
let index = string.index(string.startIndex, offsetBy: n-1)

// subString 구하는 법
let start: Int = 1
let end: Int = 3

let subString = string[start...end]


// 특정 charactor replace
let replacing = "abcde".replacingOccurrences(of: "a", with: "+")

print(replacing)

// 출력할 때 따옴표, 쌍따옴표 쓰기

print("이렇게 \' 써준다")

// 앱 종료 exit(0)

// 무한 루프
//
//while true {
//    print("")
//}

// ++, -- 연산자 없음

// charater 형과 string 한글자 구분

// CharacterSet("a")

// 거듭제곱
// pow(2, 2)


// 10진수 -> N진법
// String(integer, radix: n)
// N진법 -> 10진수
// Int("11100110", radix: n)!

let charactor: Character = "a"

print(charactor.asciiValue!) // 97


// string에 식이 들어있을 때 그대로 계산하기
let mathExpression = NSExpression(format: "3+4*6")
let mathValue = mathExpression.expressionValue(with: nil, context: nil) as! Int

print(mathValue)

// stride(from:1, to:5, by:2)       // open range..5 불포함 1,3 까지만
// stride(from:1, through:5, by:2)  // closed range..5 포함 1,3,5까지

for even in stride(from:1, to:5, by:2) {
    print(even)
}


// Dictionary 사용하기
var dic: [Int: String] = [:]

dic = [1:"a", 2:"b", 3:"c"]

// 값 수정하기
dic.updateValue("c", forKey: 2)
dic[3] = "d"

print(dic)

// 접근 하려면 언래핑 dic[1]!

for (key, value) in dic {
    print(key)            // 1,2,3
    print(value)          // a,b,c
}

// 단, 순서는 뒤죽박죽이다!!!! (Dictionary는 순서가 없음)

// dic.removeValue(forKey:4)  // 특정 키값 삭제
// dic.removeAll()            // 전체 삭제

// key를 바꿀경우 지우고 다시 넣어줘야함

// dictionary key로 sort하기

let sort = dic.sorted(by: {$0.key < $1.key})
print(sort)

