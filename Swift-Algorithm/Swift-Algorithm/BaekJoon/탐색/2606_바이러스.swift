//
//  2606_바이러스.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// https://www.acmicpc.net/problem/2606

/*

 어느 날 1번 컴퓨터가 웜 바이러스에 걸렸다. 컴퓨터의 수와 네트워크 상에서 서로 연결되어 있는 정보가 주어질 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 출력하는 프로그램을 작성하시오.

 1번과 연결된 컴퓨터만 탐색

 7
 6
 1 2
 2 3
 1 5
 5 2
 5 6
 4 7

 */

func 백준2606() {

    let computer = Int(readLine()!)!

    let connection = Int(readLine()!)!

    var graph : [[Int]] = Array(repeating: [], count: computer+1)

    for _ in 0..<connection {
        let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = relation[0]
        let b = relation[1]
        graph[a].append(b)
        graph[b].append(a)
        graph[a].sort()
        graph[b].sort()
    }

    var visited: [Bool] = Array(repeating: false, count: graph.count)
    var count = 0

    func dfs(_ now: Int) {
        visited[now] = true

        for i in graph[now] {
            if !visited[i] {
                dfs(i)
                count += 1
            }
        }
    }


    dfs(1)
    print(count)
}
