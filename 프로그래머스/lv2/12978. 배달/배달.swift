import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    //마을이 하나라면 자기 자신밖에 안되므로 1을 반환
    if N == 1 { return 1}
    //모든 거리를 저장
    var allDistances = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    //모든 연결을 세팅
    setConnection(n:N,connections: road, allDistances: &allDistances)
    //플로이드로 가장 짧은 거리를 찾음
    floyd(n: N, allDistances: &allDistances)
    //배달 가능한 마을을 반환
    return findEnableDelivery(n: N, allDistances: allDistances, k: k)
}

//k보다 작거나 같은 마을을 반환함.
func findEnableDelivery(n:Int,allDistances:[[Int]],k:Int) -> Int {
    return allDistances[1].filter{$0 <= k}.count
}

//모든 연결을 저장
func setConnection(n:Int,connections:[[Int]],allDistances:inout[[Int]]) {
    //자기 자신은 0으로 처리
    for i in 1...n {
        allDistances[i][i] = 0
    }
    //만약 연결된 도로가 2개 이상이라면 더 작은 거리를 넣어줌.
    for connection in connections {
        allDistances[connection[0]][connection[1]] = min(allDistances[connection[0]][connection[1]],connection[2])
        allDistances[connection[1]][connection[0]] = min(allDistances[connection[1]][connection[0]],connection[2])
    }
}

//플로이드로 가장 짧은 거리를 넣어줌.
func floyd(n:Int,allDistances:inout [[Int]]) {
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                if allDistances[j][i] == Int.max || allDistances[i][k] == Int.max { continue }
                if allDistances[j][i] + allDistances[i][k] < allDistances[j][k] {
                    allDistances[j][k] = allDistances[j][i] + allDistances[i][k]
                }
            }
        }
    }
}
