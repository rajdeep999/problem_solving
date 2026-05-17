# Link: https://leetcode.com/problems/top-k-frequent-elements/

from collections import Counter
from typing import List

class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count = Counter(nums)

        bucket = [[] for _ in range(len(nums)+1)]

        for num, freq in count.items():
            bucket[freq].append(num)

        res_li = []
        for i in range(len(bucket)-1, 0, -1):
            if not bucket[i]: 
                continue
                
            res_li.extend(bucket[i])
            if len(res_li) >= k:
                return res_li[:k]
            

# Time complexity: O(N)
# Space complexity: O(N)
            


class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        return [item[0] for item in Counter(nums).most_common(k)]
    

# Time complexity: O(n log K)
# Space complexity: O(N)