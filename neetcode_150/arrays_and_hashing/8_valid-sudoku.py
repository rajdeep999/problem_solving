# Link: https://leetcode.com/problems/valid-sudoku/

from collections import defaultdict
from typing import List

class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        col_set = defaultdict(set)
        row_set = defaultdict(set)
        square_set = defaultdict(set)

        for i in range(9):
            for j in range(9):
                num = board[i][j]
                if num == '.':
                    continue

                sq = (i // 3, j // 3)     

                if num in row_set[i] or num in col_set[j] or num in square_set[sq]:
                    return False

                row_set[i].add(num)
                col_set[j].add(num)
                square_set[sq].add(num)
        
        return True
    
# Time complexity: O(1)
# Space complexity: O(1)
# As size is limited hence both 0(1) if board can grew then 
# Time complexity: O(n^2)
# Space complexity: O(n^2)