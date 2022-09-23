//
//  Array&String.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func arrayPractice() {
    // 2차원 배열 만들기
    // var array = [[Int]]()

    // 2차원 배열 1차원으로 만들기

    var array2 = [[1,2,3], [2,3], [4]]
    let flatten = array2.flatMap { $0 } // [1,2,3,2,3,4]
    let reduced = array2.reduce([],+) // [1,2,3,2,3,4]
    let joined = Array(array2.joined()) // [1,2,3,2,3,4]

    var arr = Array(repeating: 1, count: 5) // [1,1,1,1,1]
    var arr123 = Array(1...3) // [1,2,3]

    arr123.sort() // 원본 순서 변경 (오름차순) [1,2,3]
    let newArray = arr123.sorted() // 정렬한 배열을 반환
    arr123.sort(by: >) // 원본 순서 변경 (내림차순) [3,2,1]

    // index에 따라 원소 다루기

    let firstIndex = arr123.firstIndex(of: 3)! // 해당 원소 처음 만나는 인덱스 찾기

    arr123.remove(at: 2) // 해당 인덱스 원소 지우기

    arr123.append(6) // 맨 뒤에 새 원소 추가

    let removedFirst = arr123.removeFirst() // 맨 앞 원소 지우고 반환

    let removedLast = arr123.removeLast() // 맨 뒤 원소 지우고 반환 (옵셔널 아님:원본 배열 비어있으면 절대 안 됨)

    let popedLast = arr123.popLast()! // 맨 뒤 원소 지우고 반환 (옵셔널)

    arr123.insert(3, at: 2) // 특정 인덱스(2)에 원소(3) 넣기

    let containable = arr123.contains(3) // 특정 원소 있는지 확인 (true/false)

    arr123.reverse() // 순서 반전

    let first = arr123.first! // 첫 원소 반환

    arr123.removeAll() // 모든 원소 지우기

    arr123.removeAll(where: { $0 % 2 == 0}) // 조건을 만족하는 모든 원소 지우기

    arr123.swapAt(0, 1) // 원소 스왑


    // 최대 최솟값

    var min = arr123.min()!
    var max = arr123.max()!

    // 순회하며 원소와 인덱스 참조 - enumerated()

    for (index, value) in arr123.enumerated() {
        print("\(index), \(value)")
    }

    // 인덱스로 순회

    // 정방향
    // count 사용
    for i in 0..<arr.count {
        print(arr[i])
    }

    // indices 사용
    for i in arr.indices {
        print(arr[i])
    }

    // 역방향
    for i in (0..<arr.count).reversed() {
        print(arr[i])
    }

    for i in arr.indices.reversed() {
        print(arr[i])
    }
    // 아니면 배열 자체를 뒤집고 정방향 순회 해도 됨


    // 배열의 각 요소 수 세기 Counter 객체

    let stringArray = ["one", "two", "three", "four", "one"]
    var counter = [String: Int]()
    stringArray.forEach { counter[$0, default: 0] += 1 }
    print(counter) // ["three": 1, "one": 2, "two": 1, "four": 1]

    // 배열 특정 요소 수 세기

    let stringArray2 = ["D", "D", "R", "D"]
    // stringArray2.filter { $0 == "D" }.count // 3

    var reducedArray = [1, 2, 3]
    reducedArray.reduce(0, +) // 6 // 모든 원소 더하기 (0은 초기값)
    reducedArray.reduce(0, -) // -6 // 모든 원소 빼기

}

func stringPractice() {

    // ch를 cnt만큼 반복한 String 만들기
    let ch = "아"
    let cnt = 3
    let string = String(repeating: ch, count: cnt)

    // var strings = string.split(separator: " ") // 공백 기준으로 분리

    var stringZedd = "Hello Zedd!"
    var arrayZedd = stringZedd.components(separatedBy: " ")
    print(arrayZedd) // ["Hello", "Zedd"]

    var stringZedd2 = "1+2-3*4/5"
    var arrayZedd2 = stringZedd2.components(separatedBy: ["+","-","*","/"])

    print(arrayZedd2) // ["1","2","3","4","5"]
    print(arrayZedd2[0] + arrayZedd2[1]) // 12
    // Int 배열일 경우 3으로

    let arrHello = ["Hello", "World", "!"]
    var helloworld = arrHello.joined() // "HelloWorld!"

    helloworld = arrHello.joined(separator: " ") // Hello World !
    helloworld = arrHello.joined(separator: ", ") // Hello, World, !

    var stringABC = "abcdef"
    stringABC = stringABC.capitalized  // 첫번째만 대문자로 변경 "Abcdef"
    stringABC = stringABC.uppercased() // 전체 대문자로 변경 "ABCDEF"
    stringABC = stringABC.lowercased() // 전체 소문자로 변경 "abcdef

    stringABC.contains("a")  // true/false

    var str2 = stringABC.replacingOccurrences(of: "a", with: "b")
    print(stringABC)  // 원본에 영향 없음
    print(str2) // bbcdef

    // String 인덱스 다루기

    var strABCD = "abcdef"

    // 문자열 원소 접근
    //str[0] // 직접 접근 안됨. String 인덱스로 접근해야함

    strABCD[strABCD.startIndex] // "a"

    // 3번째 문자 가져오기
    let index = strABCD.index(strABCD.startIndex, offsetBy: 3 - 1)
    strABCD[index] // "c"

    // 일정 범위의 문자열만 가져오기
    let sub = strABCD[strABCD.startIndex...index] // "abc"

    // 특정 원소의 인덱스
    strABCD.firstIndex(of: "c")


    // 문자열 자르기

    let s = "HelloWorld"
    let firstIndex = s.index(s.startIndex, offsetBy: 0)
    let lastIndex = s.index(s.endIndex, offsetBy: -5)
    // "Hello"
    
    var v = s[firstIndex ..< lastIndex]

    print(v)


    // "Hello"
    var prefix = s.prefix(5)
    // "World"
    var suffix = s.suffix(5)

    // 아스키코드

    // 1. unicodeScalars
    print(Character(readLine()!).unicodeScalars.first!.value)

    print(Character(readLine()!).asciiValue!)

    // Character(String) -> 아스키

    var alphabet = Array(repeating: 0, count: 26) // 알파벳 개수 카운팅
    let input = readLine()!.uppercased().map{String($0)}

    for ch in input {
        let index: Int = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("A").value)
        alphabet[index] += 1
    }

    /*
     Int(UnicodeScalar(ch)!.value)를 쓰면 됩니다.

     반환값이 UInt32이기 때문에, (코딩테스트를 풀 땐 Int로 쓸 일이 많겠죠?)

     아래 예시 코드처럼 Int()로 캐스팅 해주면 됩니다.
     */


    // 아스키 -> Charater(String)


    var maxIndex: Int = 0

    let answer = String(UnicodeScalar(65 + maxIndex)!) // 대문자
    print(answer)

    /*
     String(UnicodeScalar(65)!) 를 쓰면 됩니다. (예시 아스키 값 : A(65))

     UnicodeScalar()는 옵셔널을 반환하기 때문에, 강제 언래핑 !를 썼습니다.

     아스키값을 괄호 안에 넣어주면 됩니다.
     */


    // 수학


    sqrt(4.0) // 제곱근(2.0) // Double 입력, Double 반환
    pow(2.0, 3.0) // 거듭제곱(8.0(2^3)) // Double 입력, Double 반환
    String(format: "%.2f", 234.232) // 소수점 아래 자리수 제한, String 반환
    abs(-11) // 11, 절대값
    ceil(6.3) // 7.0 // 올림
    floor(4.3) // 4.0 // 내림
    round(5.5) // 6.0 // 반올림
}
