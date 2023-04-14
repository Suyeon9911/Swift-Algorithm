    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }

    // 상하좌우

    let r = rc[0]
    let c = rc[1]

    var map = Array(repeating: [Int](), count: r)

    for i in 0..<r {
        map[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
    }

    // 일단 bfs

    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var answer = 0

    func DFS(_ y: Int, _ x: Int, _ count: Int, _ alphabet: Int) {
        answer = max(answer, count)

        for i in 0..<4 {
            let nextY = y + dy[i]
            let nextX = x + dx[i]

            if nextY < 0 || nextY >= r || nextX < 0 || nextX >= c {
                continue
            }

            let n = 1 << map[nextY][nextX] // 1을 알파벳의 숫자 만큼 shift 한 이진수 저장.

            // 마스킹한 값이 같지 않으면 .. dfs 수행.! 다음으로 두개다 방문했다 치니까 or연산자로 !
            if alphabet & n == 0 {
                DFS(nextY, nextX, count + 1, alphabet | n)
            }
        }
    }

    // 초기 : C는 2니까 1에서 2만큼 shift 한 이진수 저장.

    DFS(0, 0, 1, 1 << map[0][0])
    print(answer)