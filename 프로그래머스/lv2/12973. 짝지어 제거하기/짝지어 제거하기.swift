import Foundation

func solution(_ s:String) -> Int{
    var STK = [Character]()
    var arr = Array(s)

    for i in arr.indices {
        if STK.isEmpty { STK.append(arr[i]) }
        else {
            if STK.last! == arr[i] { STK.removeLast() }
            else { STK.append(arr[i]) }
        }
    }

    return STK.isEmpty ? 1 : 0
}