# link: https://leetcode.com/problems/reverse-linked-list/

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head):
        prev = None
        while head:
            tmp_next = head.next
            head.next,prev  = prev, head
            head = tmp_next

        return prev
    
# Time complexity: O(N)
# Space complexity: O(1)
