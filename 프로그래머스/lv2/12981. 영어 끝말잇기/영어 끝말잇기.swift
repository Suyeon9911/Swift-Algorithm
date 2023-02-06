import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var answer: [Int] = []
    var round: Int = 1 // 현재 몇바퀴 돌았는지 계산
    
    var passedWord: Set<String> = []
    var failPerson: Int = 0
    
    for i in words.indices {
        
        if i == 0 {
            passedWord.insert(words[i])
            continue
        }
        
        // 인덱스 2,5,8 ... 마다 round 추가 
        if i % n == 0 {
            round += 1
        }
        
        // 탈락 조건 : 앞에서 말한 단어를 말하거나, 이어지지 않을 경우 
        if passedWord.contains(words[i]) || (words[i-1].last! != words[i].first!) {
            // 탈락 -> 그 인덱스가 몇번째 사람인지. 
            failPerson = (i % n) + 1
            break
        } else {
            passedWord.insert(words[i])
        }
    }
    
    return failPerson == 0 ? [0,0] : [failPerson, round]
}