# link: https://leetcode.com/problems/sort-colors/

from typing import List

class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        low, mid = 0, 0
        high = len(nums)-1

        while mid <= high:
            if nums[mid] == 0:
                nums[mid], nums[low] = nums[low], nums[mid]
                low+=1
                mid+=1
            elif nums[mid] == 1:
                mid+=1
            elif nums[mid] == 2:
                nums[mid], nums[high] = nums[high], nums[mid]
                high-=1
        
# Time complexity: O(N)
# Space complexity = O(1)

# Intution:
# Three pointers are used to keep track of 0, 1 and 2s
# left of low will have all 0 and right of high will have all 2 which will automatically sort the array