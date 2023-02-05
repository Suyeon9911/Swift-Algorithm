func solution(_ seoul:[String]) -> String {
    
    guard let index = seoul.firstIndex(of: "Kim") else {
        return ""
    }

    return "김서방은 \(index)에 있다"
}