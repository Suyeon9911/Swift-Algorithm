import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    
    // 유저 아이디와 제재 아이디가 주어짐
    // 각 제재 아이디 마다 해당되는 아이디 구하기 -> 2차원 배열에 저장.
    
    var idArr: [[String]] = []
    
    
    func compareId(user: String, banned: String) -> Bool {
        if user.count != banned.count {
            return false
        }
        
        for (first, second) in zip(user, banned) {
            if first != second && second != "*" {
                return false
            }
        }
        
        return true
    }
    
    for (i,banned) in banned_id.enumerated() {
        idArr.append([])
        for user in user_id {
            if compareId(user: user, banned: banned) {
                idArr[i].append(user)
            }
        }
    }
    
    // 조합을 담을 Set 자료형 answer
    // OR 아예 중복검사를 해서 조합을 만든 다음에 count만 세어주기
    var answer: [[String]] = []
    
    func dfs(_ id: [[String]],_ depth: Int,_ answer:inout [[String]],_ history: [String]) {
        if depth == id.count {
            answer.append(history.sorted())
            return 
        }
        
        if history.isEmpty {
            for i in id[depth] {
                var newHistory = history
                newHistory.append(i)
                dfs(id, depth+1, &answer, newHistory)
            }
        } else {
            for i in id[depth] {
                // 중복되지 않는 경우
                if !history.contains(i) {
                    var newHistory = history
                    newHistory.append(i)
                        dfs(id, depth+1, &answer, newHistory)
                }
            }
        }
    
    }
    
    dfs(idArr,0,&answer,[])
    
    return Set(answer).count
}