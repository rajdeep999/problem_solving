# link: https://leetcode.com/problems/set-matrix-zeroes/

class Solution:
    def setZeroes(self, matrix) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """

        # two array to store which rows and columns value need to be replace with 0
        set_row = []
        set_col = []

        # first n*m traverse to update set_row and set_col arrays
        for i in range(len(matrix)):
            for j in range(len(matrix[0])):
                if matrix[i][j] == 0:
                    if i not in set_row:
                        set_row.append(i)
                    if j not in set_col:
                        set_col.append(j)

        # update rows based on set_row array
        for i in set_row:
            for n in range(len(matrix[0])):
                        matrix[i][n] = 0

        #update cols based on set_col array
        for j in set_col:
            for m in range(len(matrix)):
                matrix[m][j] = 0


# Time complexity: O(2*(N*M)) 
# Space complexity:  O(N) + O(M)
                    
        

        