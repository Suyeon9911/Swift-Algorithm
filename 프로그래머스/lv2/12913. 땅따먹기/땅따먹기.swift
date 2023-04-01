import Foundation

func solution(_ land:[[Int]]) -> Int{
    
    // dp
    
    var dp = land
    
    for i in 1..<land.count {
        for j in 0..<4 {
            for k in 0..<4 {
                if j == k { continue } // 같은 열은 건너뛰기
                
                // 5에 다가 2, 3, 5 더한 것 중 가장 큰 값을 갱신하게 됨.
                dp[i][j] = max(dp[i][j], dp[i-1][k] + land[i][j])
                
            }
        }
    }
    
    return dp.last!.max()!
}