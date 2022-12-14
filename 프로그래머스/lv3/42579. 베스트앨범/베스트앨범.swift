import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {

    // 1. 자료형 : 딕셔너리 사용 + 장르별 고유 번호에 맞게 노래 저장
    var genresDic: [String: Int] = [:]
    var songDic: [String: [(Int,Int)]] = [:]

    for i in 0..<genres.count {
        genresDic[genres[i]] = (genresDic[genres[i]] ?? 0 ) + plays[i]
        songDic[genres[i]] = (songDic[genres[i]] ?? []) + [(i,plays[i])]
    }

    print(genresDic)
    print(songDic)

    // 2. 재생 수가 더 많은 장르 찾고 -> 그 장르에서 재생 수 높은거 2개
    // 예외; 재생 수 같으면 -> 고유번호 낮은걸로

    var answer: [Int] = []

    for genre in genresDic.sorted(by: {$0.value > $1.value}) {
        let key = genre.key

        songDic[key]!.sort(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })
        
        answer.append(songDic[key]![0].0)
        
        // 여기서 에러났었다. 무조건 곡이 2개 이상이라는 법은 없기 때문. 
        // IDE에서 새로운 testcase를 추가해줘서 알았다..
        
        if songDic[key]!.count >= 2 {
            answer.append(songDic[key]![1].0) 
        }
        
    }

    return answer
}