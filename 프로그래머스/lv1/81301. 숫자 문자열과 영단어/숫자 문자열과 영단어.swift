import Foundation

func solution(_ s:String) -> Int {
    
    var s: String = s
    let english = ["zero","one","two","three","four","five","six","seven","eight","nine"]

    for e in 0..<english.count {
        if s.contains(english[e]) {
            s = s.replacingOccurrences(of: english[e], with: String(e))
        }
    }

    var result = 0
    result = Int(s)!

    return result
}