import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n + 1)

    // 인접리스트 만들어주기
    for i in edge {
        graph[i[0]].append(i[1])
        graph[i[1]].append(i[0])
    }

    var maxCount = 0 // 먼 노드를 구하기 위해 최대 거리 저장
    var moveCountArr = Array(repeating: [Int](), count: 50001)

    func bfs() {
        var queue = [(Int, Int)]() // 노드번호, 이동횟수
        var visited = Array(repeating: false, count: n + 1)
        queue.append((1,0))

        visited[1] = true
        while !queue.isEmpty {
            let (node, moveCount) = queue.removeFirst()
            moveCountArr[moveCount].append(node)
            maxCount = max(moveCount, maxCount)

            for i in graph[node] {
                if !visited[i] {
                    queue.append((i, moveCount + 1))

                    visited[i] = true
                }
            }
        }
    }

    bfs()
    return moveCountArr[maxCount].count
}