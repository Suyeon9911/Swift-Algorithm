//
//  정수내림차순으로배치.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 정수내림차순으로배치(_ n:Int64) -> Int64 {
    let sortedNumber = Array(String(n)).map { Int(String($0))!}.sorted(by: >)
    let result = Int64(sortedNumber.map { String($0) }.joined())!
    return result
}

// 음 일단 저의 아이디어는 n 양수를 String 형변환 후 배열로 각각 저장한다음에 이걸 또 다시 Int 배열로 만들어서 sorting 헀음. 그다음에 join 해주려면 String이어야해서 다시 String 배열로 바꿔서 묶어준 뒤에 Int64로 형변환... 너무 왓다리 갓다리 해서 더 좋은 방법이 있을 것이라고 생각


// return Int64(String(Array(String(n)).sorted { $0 > $1 }))!

// 스트링 배열로 정렬해도 같은 결과가 나오나보다 !! 다시 생각해보니 이 문제의 경우 어차피 한자리씩 끊어지기 때문에 String으로도 정렬이 가능하고나 !


/*
 숫자로만 이루어진 문자열 배열을 sort를 사용하여 정렬하면 제대로 정렬이 안된다. 같은 길이의 문자열일 경우 제대로 정렬이 되지만, 길이가 다를경우 맨 앞 숫자 기준으로 정렬이 이루어진다. 따라서 아래 메소드를 활용하자.

 */

func 길이가다른String배열정렬() {
    var arr = ["43", "2", "0", "20", "2", "231233", "234", "3596823948676890000453456737"]
    arr.sort()
    // ["0", "2", "2", "20", "231233", "234", "3596823948676890000453456737", "43"]

    let arrSorted = arr.sorted{ $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
    // ["0", "2", "2", "20", "43", "234", "231233", "3596823948676890000453456737"]
}



// Int64(String(n).sorted(by: >).reduce("") {String($0) + String($1)})!

// 요건 정렬후에 합쳐주는 방식에서 reduce를 사용!

// 추가적으로 알게된 것 !  Int64 이니셜라이저의 매개변수에 Array 타입이 없고 String 타입은 있기 때문에 변환해서 전달 !



