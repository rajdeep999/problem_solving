# Link: https://leetcode.com/problems/valid-parentheses/

class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        mapping_dict = {')':'(', ']':'[', '}':'{'}

        for i in s:
            if i in mapping_dict:
                if not stack or stack[-1] != mapping_dict[i]:
                    return False
                stack.pop()
            else:
                stack.append(i)

        if len(stack) > 0:
            return False
        return True
    
# Time complexity: O(n)
# Space complexity: O(n)