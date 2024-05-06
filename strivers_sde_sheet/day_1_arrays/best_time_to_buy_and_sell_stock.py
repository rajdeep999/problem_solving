# link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

from typing import List

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Initialize variables to track the minimum price and maximum profit
        min_price , max_profit = prices[0], 0

        # Iterate through the prices starting from the second element
        for i in prices[1:]:
            # Update the minimum price if the current price is lower
            if i < min_price:
                min_price = i
            else:
                # Calculate the profit if selling at the current price
                # and update the maximum profit if it's greater than the current maximum
                max_profit = max(max_profit, i - min_price)
        return max_profit
    

# Time complexity: O(N)
# Space complexity: O(1)