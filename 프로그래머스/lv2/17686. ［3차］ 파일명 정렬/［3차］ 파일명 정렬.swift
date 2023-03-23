func solution(_ files:[String]) -> [String] {
    
    // 가장 먼저 정해야 할 것 : Head Number Tail을 저장할 자료형 결정하기.
    // Struct 로 하던지 튜플 배열로 
    
    var separted = [(String, String, String)]()
    
    for i in files {
        // 분리를 어떻게 하면 좋을까.
        let array = Array(i)
        
        var head = ""
        var number = ""
        var tail = ""
        
        var numCheck = 0
        
        for j in array {
            if Int(String(j)) == nil {
                if numCheck >= 1 {
                    tail += String(j)
                } else {
                    head += String(j)
                }
            } else {
                if tail.count > 0 {
                    tail += String(j)
                } else {
                    number += String(j)
                    numCheck += 1
                }
            }
        }
        separted.append((head, number, tail))
    }
    
    let headSorted = separted.sorted {
        if $0.0.lowercased() == $1.0.lowercased() {
            return Int($0.1)! < Int($1.1)!
        } else {
            return $0.0.lowercased() < $1.0.lowercased()
        }
    }
    
    var result = [String]()
    
    for i in headSorted {
        result.append(i.0+String(i.1)+i.2)
    }
    
    return result
}