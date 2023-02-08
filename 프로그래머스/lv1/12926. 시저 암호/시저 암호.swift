func solution(_ s:String, _ n:Int) -> String {
    let upperString = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    let lowerString = Array("abcdefghijklmnopqrstuvwxyz")
    var result = ""

    for i in s {
        if i == " " {
            result.append(" ")
        } else if lowerString.contains(i) {
            var newIndex = (lowerString.firstIndex(of: i)! + n) % 26

            result.append(String(lowerString[newIndex]))
        } else {
            var newIndex = (upperString.firstIndex(of: i)! + n )  % 26
            result.append(String(upperString[newIndex]))
        }
    }

    return result
}