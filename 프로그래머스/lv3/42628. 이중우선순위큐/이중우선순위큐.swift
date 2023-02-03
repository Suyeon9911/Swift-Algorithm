import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var queue: [Int] = []
    
    for o in operations {
        if o.prefix(1) == "I" {
            let string = String(o[o.index(o.startIndex, offsetBy:2)..<o.endIndex])
            queue.append(Int(string)!)
        } else if o == "D -1" {
            if queue.isEmpty { continue }
            queue = queue.sorted(by: >)
            queue.removeLast()
        } else {
            if queue.isEmpty { continue }
            queue = queue.sorted(by: <)
            queue.removeLast()
        }
    }
    
    return queue.isEmpty ? [0,0] : [queue.max()!, queue.min()!]
}