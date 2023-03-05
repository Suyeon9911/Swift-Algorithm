import Foundation    

// 1. 적록색약이 아닌 사람 !
    // 2. 적록색약인 사람 -> R이나 G중 하나로 통일 하기


    let n = Int(readLine()!)!

    var picture: [[String]] = []
    var secondPicture: [[String]] = []

    for _ in 1...n {
        let input = readLine()!
        let color = input.replacingOccurrences(of: "G", with: "R")

        picture.append(Array(input).map { String($0) })
        secondPicture.append(Array(color).map { String($0) })
    }



    func bfs(x: Int, y: Int, color: String) {
        picture[x][y] = "V"
        var queue = [(x,y,color)]

        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]

        var idx = 0
        
        while queue.count > idx {
            let (cx,cy,ccolor) = queue[idx]
            idx += 1

            for i in 0..<4 {
                let nx = cx + dx[i]
                let ny = cy + dy[i]

                if (0..<n) ~= nx && (0..<n) ~= ny {
                    if picture[nx][ny] != "V" && picture[nx][ny] == ccolor {
                        picture[nx][ny] = "V"
                        queue.append((nx,ny,ccolor))
                    }
                }
            }
        }
    }


    var section = 0

    for i in 0..<picture.count {
        for j in 0..<picture[i].count {
            if picture[i][j] != "V" {
                section += 1
                bfs(x: i, y: j, color: picture[i][j])
            }
        }
    }

    var redGreenSection = 0
    picture = secondPicture

    for i in 0..<picture.count {
        for j in 0..<picture[i].count {
            if picture[i][j] != "V" {
                redGreenSection += 1
                bfs(x: i, y: j, color: picture[i][j])
            }
        }
    }

    print(section, redGreenSection)