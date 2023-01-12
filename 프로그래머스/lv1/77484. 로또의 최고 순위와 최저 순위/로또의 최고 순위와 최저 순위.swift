import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var sameNumber = 0
    var zeroCount = 0 
    var answer:[Int] = []
    
    for i in lottos {
        if win_nums.contains(i) {
            // 당첨번호에 포함되어 있으면 
            sameNumber += 1
        }
        
        if i == 0 {
            zeroCount += 1
        }
    }
    
    // 0인 경우 경우의 수 따지기 
    // 0이 1개면 -> +1 or 0, 0이 두개면 0, 1, 2  0 이 3개면 0,1,2,3 .. 
    // 0의 개수 +1 만큼의 경우의 수 가 생김 
    
    answer.append(sameNumber) // 0 이 있음에도 아무것도 못맞춘 경우 or 0이 없었을 경우 
    
    if zeroCount > 0 {
        // 0이 있는데 맞출 경우 -> 0개수 만큼 
        for i in 1...zeroCount {
            answer.append(sameNumber+i)
        }
    }
    
    for i in 0..<answer.count {
        if answer[i] == 0 || answer[i] == 1 {
            answer[i] = 6
        } else if answer[i] == 2 {
            answer[i] = 5
        } else if answer[i] == 3 {
            answer[i] = 4
        } else if answer[i] == 4 {
            answer[i] = 3
        } else if answer[i] == 5 {
            answer[i] = 2
        } else {
            answer[i] = 1
        }
    }
    
    return [answer.min()!, answer.max()!]
}