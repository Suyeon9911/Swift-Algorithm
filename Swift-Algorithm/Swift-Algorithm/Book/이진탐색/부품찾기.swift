//
//  부품찾기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*
 동빈이네 전자 매장에는 부품이 N개 있다. 각 부품은 정수형태의 고유한 번호가 있다.
 손님이 m개 종류의 부품을 대량 구매 -> 가게 안에 부품이 모두 있는지 확인

 매장에 있는 부품

 5
 [8, 3, 7, 9, 2]

 손님이 요청한 부품

 3
 [5, 7, 9]

 전부 있으면 yes 없으면 no를 출력한다.

 */

func 부품찾기() {

    // 다량의 데이터 검색은 이진탐색으로 해결할 수 있다.

    let n = Int(readLine()!)!
    var shop = readLine()!.split(separator: " ").map { Int(String($0))! }


    let m = Int(readLine()!)!
    let need = readLine()!.split(separator: " ").map { Int(String($0))! }

    // 매장 부품 정렬해 두고 -> 탐색하면 된다.
    shop.sort()

    var answer = ""

    func binarySearch(_ array: [Int],_ target: Int,_ start: Int,_ end: Int) {

        if start > end {
            answer = "no"
        }

        var mid = (start + end) / 2

        if array[mid] == target {
            answer = "yes"
        } else if array[mid] > target {
            binarySearch(array, target, start, mid-1)
        } else {
            binarySearch(array, target, mid+1, end)
        }
    }
}

// 아니면 그냥 일단 이진탐색 코드를 외워둔다음에 알아서 이용해먹기 ?

func 부품찾기다시() {

    // 다량의 데이터 검색은 이진탐색으로 해결할 수 있다.

    let n = Int(readLine()!)!
    var shop = readLine()!.split(separator: " ").map { Int(String($0))! }


    let m = Int(readLine()!)!
    let need = readLine()!.split(separator: " ").map { Int(String($0))! }

    // 매장 부품 정렬해 두고 -> 탐색하면 된다.
    shop.sort()

    // 다른 사람들은 이진탐색 어케 구현하는지 찾아보기
    func binarySearch(_ array: [Int],_ target: Int,_ start: Int,_ end: Int) -> Int? {

        var start = start
        var end = end

        while start <= end {
            var mid = (start + end) / 2

            if array[mid] == target {
                return mid // 찾은 경우 중간 인덱스 반환
            } else if array[mid] > target {
                end = mid-1
            } else {
                start = mid+1
            }
        }

        return nil
    }

    // 손님이 확인요청한 부품 번호를 하나씩 확인
    for i in need {
        var result = binarySearch(shop, i, 0, n-1) // 부품이 존재하는지 하나씩 확인 타겟

        if result != nil {
            print("yes", terminator: " ")
        } else {
            print("no", terminator: " ")
        }
    }
    
}

/*
 최악의 시간복잡도 : O(M x logN)
 */


// 계수정렬을 활용한 풀이
func 부품찾기계수정렬() {

    let n = Int(readLine()!)!
    var array = Array(repeating: 0, count: 1000001)

    var shop = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in shop {
        // 가게에 있는 부품 번호 인덱스에 기록
        array[i] = 1
    }

    let m = Int(readLine()!)!
    let need = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in need {
        // 손님이 요청한 부품 하나씩 확인
        if array[i] == 1 {
            // 손님이 요청한 부품이 들어있는 경우
            print("yes", terminator: " ")
        } else {
            print("no", terminator: " ")
        }
    }
}

// 특정한 수가 한번이라도 등장했는지 를 검사하면 되므로 집합 자료형을 이용해서 구현해도 됨

func 부품찾기집합자료형() {

    let n = Int(readLine()!)!
    var shop = readLine()!.split(separator: " ").map { Int(String($0))! }
    // 배열을 집합으로 바꾸기 ?? 어케해 찾아보ㅏ

    var shopSet: Set<Int> = []

    for i in shop {
        shopSet.insert(i)
    }

    // 일단 생각나는건 이 방법 뿐이군

    print(shop)
    print(shopSet)

    let m = Int(readLine()!)!
    let need = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in need {
        if shop.contains(i) {
            print("yes")
        } else {
            print("no")
        }
    }

    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

    oddDigits.union(evenDigits).sorted()
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersection(evenDigits).sorted()
    // []
    oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
    // [1, 9]
    oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
    // [1, 2, 9]

    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]

    houseAnimals.isSubset(of: farmAnimals)
    // 참
    farmAnimals.isSuperset(of: houseAnimals)
    // 참
    farmAnimals.isDisjoint(with: cityAnimals)
    // 참


    var intSet: Set<Int> = []

    intSet.insert(2) // (true, 2)
    intSet.insert(3) // (true, 3)
    intSet.insert(4) // (true, 4)
    intSet.insert(2) // (false, 2) 중복된 값이면 false를 반환
    intSet.update(with: 100) // nil 새로운 값이면 추가후 nil을 반환
    intSet.update(with: 100) // Optional(100) 중복된 값이면 덮어쓰기 후 덮어쓰기 전 값 반환
    // intSet = [2, 3, 4, 100]


}

// Set : insert, remove, contains
