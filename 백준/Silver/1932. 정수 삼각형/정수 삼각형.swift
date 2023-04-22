    let size = Int(readLine()!)!

    var triangle: [[Int]] = []

    for _ in 1...size {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }

        triangle.append(line)
    }

    var left = 0
    var right = 0

    for i in 1..<size {
        for j in 0..<triangle[i].count {

            if j == 0 {
                // j가 첫번째 index일 경우
                left = 0
            } else {
                left = triangle[i-1][j-1]
            }

            if j == triangle[i].count-1 {
                // j가 마지막 index일 경우
                right = 0
            } else {
                right = triangle[i-1][j]
            }


            triangle[i][j] = triangle[i][j] + max(left, right)
        }
    }

    print(triangle[size-1].max()!)