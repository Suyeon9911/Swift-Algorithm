//
//  문자열내마음대로정렬하기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

func 문자열마음대로정렬(_ strings:[String], _ n:Int) -> [String] {

    let sorted = strings.sorted { prev, next in
        var prevString = prev[prev.index(prev.startIndex, offsetBy: n)]
        var nextString = next[next.index(next.startIndex, offsetBy: n)]

        if prevString == nextString {
            return prev < next
        } else {
            return prevString < nextString
        }
    }

    return sorted
}

func 문자열마음대로정렬다른풀이(_ strings:[String], _ n:Int) -> [String] {
    struct SortString {
        var string: String
        var sortedChar: String
    }

    var stringArray: [SortString] = []
    var resultArray: [String] = []

    for i in strings {
        var char = String(i[i.index(i.startIndex, offsetBy: n)])
        stringArray.append(SortString(string: i, sortedChar: char))
    }

    let sortedArray = stringArray.sorted {
        if $0.sortedChar == $1.sortedChar {
            return $0.string < $1.string
        }
        return $0.sortedChar < $1.sortedChar
    }


    for i in sortedArray {
        resultArray.append(i.string)
    }

    return resultArray
}


func 문자열정렬다른사람풀이(_ strings:[String], _ n:Int) -> [String] {
    // 아 제법 간단한데.. ㅋㅋ ?
    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}

func 문자열정렬다른풀이2(_ strings:[String], _ n:Int) -> [String] {
    let answer: [String] = strings.sorted {
        let left: Character = $0[$0.index($0.startIndex, offsetBy: n)]
        let right: Character = $1[$1.index($1.startIndex, offsetBy: n)]

        if left == right {
            return $0 < $1
        } else {
            return left < right
        }
    }

    return answer
}

// 비슷하네용 
