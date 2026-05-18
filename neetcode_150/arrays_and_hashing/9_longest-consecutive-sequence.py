# Link: https://leetcode.com/problems/longest-consecutive-sequence/

from typing import List

class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        nums = set(nums)
        
        max_seq = 0

        for num in nums:
            if num-1 not in nums:
                curr_seq = 1
                while num+curr_seq in nums:
                    curr_seq+=1

                max_seq = max(max_seq, curr_seq)
            
        return max_seq
    

# Time complexity: O(n)
# Space complexity: O(n)