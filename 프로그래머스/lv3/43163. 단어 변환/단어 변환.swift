import Foundation

func isChange(_ word: String, _ now: String) -> Bool {
    
    if word.count != now.count {
        return false
    }
    
    var count: Int = 0
    
    let arrWord = Array(word)
    let arrNow = Array(now)
    
    for i in 0..<arrWord.count {
        if arrWord[i] != arrNow[i] {
            count += 1
        }
        
        if count > 1 {
            return false
        }
    }
    
    return true
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) {
        return 0
    }
    
    var queue: [String] = []
    queue.append(begin)
    
    var check = [Bool] (repeating: false, count: words.count)
    var count: Int = 0
    
    while !queue.isEmpty {      
        let now = queue.popLast()!
        if now == target {
            break
        }
        
        count += 1
        for idx in 0..<words.count {
            if !check[idx] {
                if isChange(words[idx], now) {
                    queue.append(words[idx])
                    check[idx] = true
                }
            }
        }
    }
    
    return count
}