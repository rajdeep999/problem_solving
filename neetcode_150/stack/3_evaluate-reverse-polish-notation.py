# Link: https://leetcode.com/problems/evaluate-reverse-polish-notation/description/

from typing import List

class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        stack = []
        ops = {
            '+': lambda a,b: a+b,
            '-': lambda a,b: a-b,
            '*': lambda a,b: a*b,
            '/': lambda a,b: int(a/b),

        }

        for token in tokens:
            if token in ops:
                b, a = stack.pop(), stack.pop()
                stack.append(ops[token](a,b))
            else:
                stack.append(int(token))

        return stack.pop()

# Time complexity: O(n)
# Space complexity: O(n)