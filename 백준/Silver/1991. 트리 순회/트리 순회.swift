    let node = Int(readLine()!)!

    var tree = [String: [String]]()

    for _ in 1...node {
        let connect = readLine()!.split(separator: " ").map { String($0) }

        tree[connect[0], default: []] = [connect[1], connect[2]]
    }

    var result = ""

    func preOrder(root: String) {
        result += root
        // left : tree[root]의 0번째 !
        if tree[root]![0] != "." {
            preOrder(root: tree[root]![0])
        }
        // right : tree[root]의 1번째
        if tree[root]![1] != "." {
            preOrder(root: tree[root]![1])
        }
    }

    func postOrder(root: String) {
        if tree[root]![0] != "." {
            postOrder(root: tree[root]![0])
        }

        if tree[root]![1] != "." {
            postOrder(root: tree[root]![1])
        }
        result += root
    }

    func inOrder(root: String) {
        if tree[root]![0] != "." {
            inOrder(root: tree[root]![0])
        }
        result += root

        if tree[root]![1] != "." {
            inOrder(root: tree[root]![1])
        }
    }

    preOrder(root: "A")
    print(result)

    result = ""
    inOrder(root: "A")
    print(result)

    result = ""
    postOrder(root: "A")
    print(result)