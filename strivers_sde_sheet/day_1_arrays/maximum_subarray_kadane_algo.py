# link: https://leetcode.com/problems/maximum-subarray/

from typing import List

class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        # initializing  the curr_sum and max_sum
        curr_sum, max_sum = nums[0], nums[0]

        for i in nums[1:]:
            # if addition of curr value is increasing the curr sum then adding it else taking curr value
            curr_sum = max(i, curr_sum+i)
            # updating the max_sum if curr_sum its greater than existing max_sum
            max_sum = max(max_sum, curr_sum)

        return max_sum
    
# Time complexity: O(n)
# Space complexity: O(1)