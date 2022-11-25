func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    var string = String()
    
    for i in 0..<arr1.count {
        let first = Int(String(arr1[i], radix: 2))!
        let second = Int(String(arr2[i], radix: 2))!
        let sum = String(first+second)
        
        for i in sum {
            if i == "1" || i == "2" {
                string += "#"
            } else {
                string += " "
            }
        }
        
        if string.count < n {
            for _ in 0...n-string.count-1 {
                string = " \(string)"
            }
        }
        
        answer.append(string)
        string = ""
    }
    return answer
}