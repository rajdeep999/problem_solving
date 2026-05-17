# Link: https://leetcode.com/problems/product-of-array-except-self/

from typing import List

class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        num_len = len(nums)
        res = [1]* num_len
        
        prefix = 1
        for i in range(num_len):
            res[i]*=prefix
            prefix*=nums[i]

        postfix = 1
        for i in range(num_len-1,-1, -1):
            res[i]*=postfix
            postfix*=nums[i]

        return res
    
# Time complexity: O(n)
# Space complexity: O(1)