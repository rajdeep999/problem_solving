# link: https://leetcode.com/problems/next-permutation/
from typing import List

class Solution:
    def nextPermutation(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        
        break_idx = -1
        j =  len(nums)-2

        # finding first smaller element than it right adjacent element which will be our break_idx
        while j>=0 and break_idx == -1:
            if  nums[j] < nums[j+1]:
                break_idx = j
            j-=1

        # if we  find break idx then we will try to find next greater element than this break_idx swap the values 
        # and then reverse all the elements right to this
        if break_idx != -1:
            j = len(nums)-1
            while nums[j]<=nums[break_idx]:
                j-=1
            nums[j] , nums[break_idx] = nums[break_idx], nums[j]
            nums[break_idx +1:] = nums[break_idx+1:][::-1]

        # if we didnt find the break_idx then reverse the entire array
        else:
            nums[:] = nums[:][::-1]


# time complexity: O(3n)
# space  complexity: O(1)

# logic:
# to find the next greater permutation there are two possibility
# 1) if its already greatest permutation then we need to give first permutation 
# which will be reverse of the given array
# 2) if not then we need to find next greater one for that we need to perform following steps:
# Step 1: find the break_idx from the right which has element smaller then its right adjacent element
# Step 2: now find the first bigger element than this break_idx element and swap them
# Step 3: now reverse the array after this break_idx
# Step 4: if we didnt find the break_idx then its already greatest permutation so reverse the array