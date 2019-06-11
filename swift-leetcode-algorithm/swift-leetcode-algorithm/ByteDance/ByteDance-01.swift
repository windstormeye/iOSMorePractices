//
//  ByteDance-01.swift
//  swift-leetcode-algorithm
//
//  Created by PJHubs on 2019/6/10.
//  Copyright © 2019 PJHubs. All rights reserved.
//  无重复字符的最长子串

import Foundation


func byteDance01(_ s: String) -> Int {
    var longestSubStringLength = 0
    var finalString = ""
    var index = 0
    for c in s {
        if finalString.contains(c) {
            longestSubStringLength = max(longestSubStringLength, finalString.count)
            let endIndex = finalString.firstIndex(of: c)
            let stringRange = finalString.startIndex...endIndex!
            finalString.removeSubrange(stringRange)
        }
        finalString.append(c)
        index += 1
    }
    return max(longestSubStringLength, finalString.count)
}
