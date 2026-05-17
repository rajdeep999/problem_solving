# link: https://leetcode.com/problems/valid-anagram/description/

class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False

        s_cnt = [0] * 26

        for i in range(len(s)):
            s_cnt[ord(s[i]) - 97] += 1
            s_cnt[ord(t[i]) - 97] -= 1

        return all(i == 0 for i in s_cnt)
    

# Time complexity: O(N)
# Space complexity: O(1)