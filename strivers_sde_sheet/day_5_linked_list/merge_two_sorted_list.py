# Link: https://leetcode.com/problems/merge-two-sorted-lists/


from typing import Optional
# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        temp_head = ListNode()
        new_head = temp_head

        while list1 and list2:
            if list1.val <= list2.val:
                temp_head.next = list1
                list1 = list1.next
            else:
                temp_head.next = list2
                list2 = list2.next
            
            temp_head = temp_head.next

        temp_head.next = list1 if list1 else list2

        return new_head.next
    
# Time complexity: O(N+M)
# Space complexity: O(1)