func solution(_ strings:[String], _ n:Int) -> [String] {
    
//     struct SortString {
//         var string: String
//         var sortedChar: String
//     }

//     var stringArray: [SortString] = []
//     var resultArray: [String] = []

//     for i in strings {
//         var char = String(i[i.index(i.startIndex, offsetBy: n)])
//         stringArray.append(SortString(string: i, sortedChar: char))
//     }

//     let sortedArray = stringArray.sorted {
//         if $0.sortedChar == $1.sortedChar {
//             return $0.string < $1.string
//         }
//         return $0.sortedChar < $1.sortedChar
//     }


//     for i in sortedArray {
//         resultArray.append(i.string)
//     }

//     return resultArray
    
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