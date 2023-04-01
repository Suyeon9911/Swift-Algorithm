import Foundation

func solution(_ record:[String]) -> [String] {
    
    var NicknameDic: [String: String] = [:]
    // var chatState: [String: (order: Int, nickname: String)] = [:]
    var chatState: [(id: String, state: String)] = []

    for i in record {
        let input = i.split(separator: " ").map { String($0) }
        let (state, id) = (input[0], input[1])

        switch state {
            case "Enter":
                let nickname = input[2]
                
                if NicknameDic[id] != nil {
                    // 기존에 닉네임이 있는데, 이름 바꾸고 들어옴 바꿔준다.
                    NicknameDic[id] = nickname
                    // chatState.indices.filter { chatState[$0].id == id }.forEach { chatState[$0].nickname = nickname }
                } else {
                    // 없으면 추가해준다.
                    NicknameDic[id] = nickname
                }
                chatState.append((id: id, state: "들어왔습니다"))
            case "Leave":
                let leaveName = NicknameDic[id]!
                chatState.append((id: id, state: "나갔습니다"))
                // NicknameDic[id]! = ""
            case "Change":
                let changeName = input[2]
                NicknameDic[id]! = changeName
                // chatState.indices.filter { chatState[$0].id == id }.forEach { chatState[$0].nickname = changeName }
            
            default:
                break
        }
    }

    var result: [String] = []
    
    for i in chatState.indices {
        let id = chatState[i].id 
        
        result.append("\(NicknameDic[id]!)님이 \(chatState[i].state).")
    }

    return result
}