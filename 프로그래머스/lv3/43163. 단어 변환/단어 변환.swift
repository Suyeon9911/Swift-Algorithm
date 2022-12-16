import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    // 타겟 단어를 만드는데 최단거리로 : BFS로 해야될 것 같음.

    // 1. 탐색할 단어 tree 만들자.

    func isOneDifferentWord(_ first: String, _ second: String) -> Bool {
        let first = Array(first), second = Array(second)
        var count = 0
        for i in 0..<first.count {
            if first[i] != second[i] {
                count += 1
            }
        }
    
        return count == 1 ? true : false
    }


    // bfs로 푸는데 큐에 1글자만 다른 경우를 넣기
    if !words.contains(target) {
        return 0
    }
    
    // BFS 
    var visited: [Bool] = Array(repeating: false, count: words.count)
    var queue: [(begin: String, count: Int)] = [] // 큐에 저장할 때 count도 같이 저장
    
    queue.append((begin, 0))
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        if now.begin == target {
            return now.count
        }
        
        for (index, word) in words.enumerated() {
            if !visited[index] && isOneDifferentWord(now.begin, word) {
                queue.append((word, now.count+1))
                visited[index] = true
            }
        }
    }
    return 0
}