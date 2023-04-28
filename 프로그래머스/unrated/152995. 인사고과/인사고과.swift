import Foundation

// func solution(_ scores:[[Int]]) -> Int {
    
//     // 1. 두 점수가 임의의 사원보다 낮은 경우 찾기
//     var removeIndex = [Int]()
//     for i in 0..<scores.count {
//         for j in i+1..<scores.count {
//             if scores[i][0] < scores[j][0] && scores[i][1] < scores[j][1] {
//                 removeIndex.append(i)
//             } else if scores[i][0] > scores[j][0] && scores[i][1] > scores[j][1] {
//                 removeIndex.append(j)
//             }
//         }
//     }
    
//     var scoreDic = [Int:Int]()
    
//     for (i,v) in scores.enumerated() {
//         scoreDic[i] = v.reduce(0,+)
//     }
    
//     if !removeIndex.isEmpty { 
//         if removeIndex.contains(0) {
//             return -1
//         }
        
//         // 만약에 제거해야하는 사원이 있다면 scores 에 filtering
//         scoreDic = scoreDic.filter { !removeIndex.contains($0.key) }
//     }
    
//     // 각 스코어의 합과 인덱스를 저장.

    
//     var sortedDic = scoreDic.sorted(by: { $0.value > $1.value })
//     var rank = 0
//     var same = 1
//     var currentValue = 0
    
//     for i in sortedDic {
        
//         if currentValue == i.value {
//             same += 1
//             if i.key == 0 {
//                 return rank
//             }
//         } else {
//             rank += same
//             same = 1
            
//             if i.key == 0 {
//                 return rank
//             }
//         }
//         currentValue = i.value
//     }
    
//     return -1
// }


func solution(_ scores: [[Int]]) -> Int {
    
    var rank = 1
    let wanho = scores[0]
    
    let wanhoTotalScore = wanho.reduce(0, +)
    let sortedTotalScores = scores.sorted(by: { $0[0] > $1[0] || ($0[0] == $1[0] && $0[1] < $1[1]) })
    var yMaximum = 0

    for score in sortedTotalScores {
        if wanho[0] < score[0] && wanho[1] < score[1] {
            return -1
        }
        if yMaximum <= score[1] {
            let totalScore = score.reduce(0, +)
            if wanhoTotalScore < totalScore {
                rank += 1
            }
            yMaximum = score[1]
        }
    }

    return rank
}