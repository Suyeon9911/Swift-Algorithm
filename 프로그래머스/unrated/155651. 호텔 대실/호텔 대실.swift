import Foundation

func solution(_ book_time:[[String]]) -> Int {
    
    // 1. 입실시간으로 정렬 - 할려면 일단 숫자로 바꿔야댐 ;;
    var timeArray: [[(Int, Int)]] = []
    
    for i in 0..<book_time.count {
        timeArray.append([])
        for j in 0...1 {
            let hour = Int(book_time[i][j].prefix(2))!
            var min = Int(book_time[i][j].suffix(2))!
            
            if j == 1 {
                min += 10
            }
            
            timeArray[i].append((hour, min))
        }
    }
    
    var sortedEnterTime = timeArray.sorted(by: {
        if $0[0].0 == $1[0].0 {
            return $0[0].1 < $1[0].1
        } else {
            return $0[0].0 < $1[0].0
        }
    })
    
    // 2. 현재 사용중인 방에서 퇴실 + 10분이랑 -> 입실 시간이 겹치면 다른 방 써야됨.
    var roomArray: [(Int, Int)] = [sortedEnterTime[0][1]] // 처음 입실하는 방은 무조건 1번
    
    for i in 1..<sortedEnterTime.count {
        for j in 0..<roomArray.count {
            if (roomArray[j].0 * 60) + roomArray[j].1 <= (sortedEnterTime[i][0].0 * 60) + sortedEnterTime[i][0].1 {
                // 퇴실 + 청소 끝난 방. // 바로 들어갈 수 있듬.
                roomArray[j] = sortedEnterTime[i][1]
                break
            }
            
            // 룸을 다 돌았는데 들어갈 수 있는 방이 없으면, 그냥 추가해주세용
            if j == roomArray.count-1 {
                roomArray.append(sortedEnterTime[i][1])
            }
        }
    }
    return roomArray.count
}