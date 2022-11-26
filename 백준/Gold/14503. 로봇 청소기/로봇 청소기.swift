 let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]

    let pd = readLine()!.split(separator: " ").map { Int(String($0))! }
    var y = pd[0]
    var x = pd[1]
    var direction = pd[2]

    var maps: [[Int]] = []

    for _ in 0..<n {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        maps.append(nums)
    }

    var count = 0

    while true {
        // 1. 현재 위치를 청소한다. ( 청소 안되어 있는 경우에만 )
        if maps[y][x] == 0 {
            maps[y][x] = 2
            count += 1
        }

        var tag = false // 청소를 하고 break 해서 빠져 나왔을 경우에 그 아래 코드는 실행되면 안되기 때문에

        // 2. 현재 위치에서 현재 방향을 기준으로 왼쪽 방향부터 차례대로 인접한 칸 탐색
        // 북 : 0, 동 (오른): 1, 남 : 2, 서 : 3 => 시계방향 . 올라가는건 -1 , 내려가는건 +1
        // 북 : (-1,0) , 동 : (0,1), 남 : (1,0), 서 : (0,-1)

        let dy = [-1, 0, 1, 0]
        let dx = [0, 1, 0, -1]

        // 북쪽에서 왼쪽 방향으로 이동하면 0 > 3 > 2 > 1 ... dy,dx 기준 한칸씩 뒤로 가는 것

        for i in 1...4 {
            let ny = y + dy[(direction-i+4)%4]
            let nx = x + dx[(direction-i+4)%4] // 다음방향임

            if ny >= 0 && ny < n && nx >= 0 && nx < m {
                if maps[ny][nx] == 0 {
                    // 다음 방향에서 청소를 할 수 있을 때 한 칸 전진하고 청소를 하면딘다. -> 탐색을 멈추고 break
                    direction = (direction-i+4)%4
                    y = ny
                    x = nx
                    tag = true
                    break
                }
            }
        }

        // 4개의 방향 모두 청소할 곳이 없을 경우

        if tag == false {
            // 왼쪽 방향을 바라본 상탱세ㅓ 유지한 채로 한칸 후진을 하고 2번으로 돌아간다.
            // 뒤쪽 방향이 막혀있으면 작동을 멈춘다
            // 뒤쪽 부터 확인해야함.

            let ny = y - dy[direction]
            let nx = x - dx[direction]

            if ny >= 0 && ny < n && nx >= 0 && nx < m {
                if maps[ny][nx] == 1 {
                    break // while 문 종료
                } else {
                    // 뒤로 후진
                    y = ny
                    x = nx

                    // 여기서 2번으로 돌리기 ! 뒤로 후진 한 경우에는 청소를 하면 안된다.
                    // 1번에서 특수 케이스를 만들어줘야함. -> if 문 추가

                }
            } else {
                // 갈때가 없어 종료
                break
            }

        }
    }

    print(count)