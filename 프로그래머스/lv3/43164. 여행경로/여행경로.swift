import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    // 도착지 기준으로 알파벳 순 정렬 : 경로가 2개 이상일 경우 알파벳이 앞선 순서이기 떄문
    let tickets = tickets.sorted { $0[1] < $1[1] }
    
    // 티켓사용 여부 기록
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result: [String] = []
    // dfs
    
    func dfs(start: String) {
        // 현재 방문한 도시 수가 티켓 수와 같다면 지금 도착한 곳이 마지막 여행지
        if result.count == tickets.count {
            result.append(start)
            return
        }
        
        // map 말고 이런 배열 탐색 for문 돌리기..
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                // 티켓의 출발지와 일치하고 사용하지 않았다면
                visited[i] = true
                result.append(start)
                dfs(start: tickets[i][1]) // 도착지가 다시 출발지가 됨
                // 정답을 이미 구했다면 return 
                if result.count == tickets.count + 1{
                    return 
                }
                // 해당 경로로 모든 도시를 방문할 수 없다면 취소하고 다른 도시 방문
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    // 항상 ICN에서 시작
    dfs(start: "ICN")
    
    
    return result
}