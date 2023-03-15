import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    /*
    1. 처음에는 가장 먼저 도착한 작업 수행
    2. 작업을 수행하는 동안 도착한 작업들은 별도의 큐에 모으기.
    3. 작업 큐에 도착한 작업들 중 수행시간이 가장 짧은 작업을 꺼내 수행
    4. 모든 작업을 처리할 때까지 반복
    예외 _ 작업들이 연달아 들어오지 않고 중간에 비어있는 시간이 있을때,
    즉 작업큐에 더이상 작업이 없고, 아직 도착할 작업들이 남았다면 가장 빨리 도착하는 작업응ㄹ 꺼내 작업 큐에 넣어준다. 
    
    */
    
    var sortedByStartTime = jobs.sorted(by: {
        if $0[0] == $1[0] { return $0[1] > $1[1] }
        else { return $0[0] > $1[0] }
    })
    
    var jobQueue: [[Int]] = [sortedByStartTime.removeLast()]
    var totalTime = 0
    var currentTime = jobQueue.first![0]
    
    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        totalTime += abs(currentTime - now[0]) + now[1] // 대기시간 + 처리시간
        currentTime += now[1]
        
        while !sortedByStartTime.isEmpty && sortedByStartTime.last![0] <= currentTime {
            jobQueue.append(sortedByStartTime.removeLast()) // 작업큐에 계속 저장
        }
        jobQueue.sort(by: { $0[1] > $1[1] }) // 처리 시간으로 정렬
        
        if jobQueue.isEmpty && !sortedByStartTime.isEmpty {
            jobQueue.append(sortedByStartTime.removeLast())
            currentTime += abs(currentTime - jobQueue.last![0])
        }
     }
    
    return totalTime / jobs.count
}