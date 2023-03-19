    let n = Int(readLine()!)!
    let tree = readLine()!.split(separator: " ").map { Int(String($0))! }
    let deleteNode = Int(readLine()!)!

    var treeDic: [Int:[Int]] = [:]

    for (index,element) in tree.enumerated() {
        treeDic[element, default: []] += [index]
    }

    // 트리 구조에서 리프 노드 추가

    for i in 0..<tree.count {
        if !Set(treeDic.keys).contains(i) {
            // tree의 key에 포함되어 있지 않을 경위
            treeDic[i] = []
        }
    }

    func removeChlidNode(array: [Int]) {
        for i in array {
            removeChlidNode(array: treeDic[i]!)
            treeDic[i] = nil
        }
    }

    // 노드 제거 상황

    var leafNode: Int = 0

    for (k,v) in treeDic {
        if k == deleteNode {
            // 그 key에 해당하는 배열에 있는 애들 다 지워줘 -> 아 근데 이게 재귀로 들어가야하네..
            removeChlidNode(array: treeDic[k]!)
            treeDic[k] = nil
        } else if v.contains(deleteNode) {
            let index = v.firstIndex(where: {$0 == deleteNode})!
            treeDic[k]?.remove(at: index)
//
//            if k == -1 {
//                print(leafNode)
//                return
//            }
        }
    }

    for i in treeDic {
        if i.key == -1 && i.value.isEmpty {
            leafNode = 0
            break
        }

        if i.value.isEmpty {
            leafNode += 1
        }
    }

    print(leafNode)