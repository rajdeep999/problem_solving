# link: https://leetcode.com/problems/pascals-triangle/

class Solution:

    def __init__(self):
        self.pascal_dp = None

    def generate(self, numRows: int):

        # Check if Pascal's triangle is not computed or if its length is less than numRows
        if self.pascal_dp is None  or len(self.pascal_dp) < numRows:

            # Initialize Pascal's triangle with appropriate length
            self.pascal_dp = [None]*max(numRows, 2)
            # Base cases for first two rows
            self.pascal_dp[0], self.pascal_dp[1] = [1], [1,1]

            # Generate Pascal's triangle
            for i in range(2, numRows):
                res_arr = []
                # Generate current row based on previous row
                for j in range(i+1):
                    # First and last elements of each row are 1
                    if i == j or j == 0:
                        res_arr.append(1)
                    else:
                        # Calculate current element using the previous row
                        res_arr.append(self.pascal_dp[i-1][j-1]+self.pascal_dp[i-1][j]) 
                self.pascal_dp[i] = res_arr

        return self.pascal_dp[:numRows]
    

# Time complexity: O(n^2)
# Space complexity: O(1)