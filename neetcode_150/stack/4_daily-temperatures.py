# Link: https://leetcode.com/problems/daily-temperatures/description/

from typing import List

class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        res_li = [0]*len(temperatures)
        stack = []

        for idx, val in enumerate(temperatures):

            while stack and temperatures[stack[-1]]< val:
                tmp_idx = stack.pop()
                res_li[tmp_idx] = idx - tmp_idx
                
            stack.append(idx)

        return res_li
    

# Time complexity: O(n)
# Space complexity: O(n)