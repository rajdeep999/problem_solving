# Link: https://leetcode.com/problems/group-anagrams/

from collections import defaultdict
from typing import List

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagram_dict = defaultdict(list)

        for s in strs:
            count = [0]* 26
            for c in s:
                count[ord(c)-97]+=1
            anagram_dict[tuple(count)].append(s)

        return list(anagram_dict.values())
    
# n = number of string, k = average length of each string
# Time complexity: O(N * K)
# Space complexity: O(N * K)