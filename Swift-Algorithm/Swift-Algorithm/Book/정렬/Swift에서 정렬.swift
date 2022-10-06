//
//  정렬메서드.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

// 정렬 메서드 sort() sorted() O(nlogn)

// sort()는 원본 배열 정렬 , sorted()는 복사 후 정렬된 배열 return
// 파라미터에 by를 넣을 경우 (Element, Element) -> Bool 클로저를 넘겨줌
// by 는 정렬기준


let ascending: (Int, Int) -> Bool = { (lhs, rhs) in
    return lhs < rhs
}

let descending: (Int, Int) -> Bool = { (lhs, rhs) in
    return lhs > rhs
}

func 정렬() {
    var array = [4, 2, 3, 1, 5]

    print(array.sorted(by: ascending))
    print(array.sorted(by: descending))
}

/*
 by 가 없는 sort() 와 sorted()를 사용하려면
 Comparable 프로토콜을 채택한 타입이어야한다.
 Comparable을 채택하면 < 오퍼레이터를 구현해줘야하고, 이 < 연산자가 비교 기준이 된다.
 */


struct Person: Comparable {
    let name: String
    let age: Int

    // 나이 기준으로 비교
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}

var peple = [
    Person(name: "hi", age: 1),
    Person(name: "hello", age: 2),
    Person(name: "bye", age: 3)
]

// peple.sort()

// 조건을 따로 설정해서 구현해보기

struct Point {
    var x: Int
    var y: Int
}

let pointArray: [Point] = [
    Point(x: 1, y: 2),
    Point(x: 2, y: 1),
    Point(x: 3, y: 3),
    Point(x: 1, y: 4)
]

let sorted = pointArray.sorted { $0.x < $1.x} // x좌표 오름차순
let sorted2 = pointArray.sorted { prev, next in
    if prev.x == next.x {

        // x 좌표 값이 같으면 y가 큰거 먼저
        return prev.y > prev.y
    }
    return prev.x < next.x
}


// 튜플도 정렬되는지 해보자 -> (Int,Int) 타입은 Comparable 프로토콜을 채택해야한다.


func tupleSort() {

    let tupleArray = [
        (1,8),
        (1,2),
        (1,3),
        (1,5),
        (2,4),
        (4,5)
    ]

    // 따라서 정렬 조건을 걸어줘야한다.

    // tupleArray.sorted { $0.0 < $1.0 } 일단 이런식으로

    // print(myGrades.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) })
    // [["A", "라"], ["A", "마"], ["A", "바"], ["B", "가"], ["B", "다"], ["C", "나"]]
    // ABC 순서가 1순위, 가나다 순서가 2순위로 적용됨

    // 이중 조건 걸려면

    let sorted = tupleArray.sorted { ($0.0 , $0.1) < ($1.0, $1.1)} // 이런식으로 하면 되려나

    print(sorted) // [(1, 2), (1, 3), (1, 5), (1, 8), (2, 4), (4, 5)]

    // 거꾸로 하려면

    // print(myGrades.sorted { ($0[0] < $1[0]) || ($0[1] > $1[1]) })
    // [["A", "바"], ["A", "마"], ["A", "라"], ["B", "다"], ["B", "가"], ["C", "나"]]
}
