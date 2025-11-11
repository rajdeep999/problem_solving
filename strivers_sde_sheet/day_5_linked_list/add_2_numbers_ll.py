# Link: https://leetcode.com/problems/add-two-numbers/

from typing import Optional        


# Approach 1
# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
    def make_single_digit_val_node(self, head):
        curr_head = head
        while curr_head:
            val = curr_head.val
            if val >= 10:
                if curr_head.next is None:
                    next_dummy = ListNode(val//10)
                    curr_head.val %=10
                    curr_head.next = next_dummy
                else:
                    curr_head.next.val+=val//10
                    curr_head.val %= 10
            curr_head = curr_head.next

        return head


    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode(0)
        tmp_head = dummy

        while l1 and l2:
            val = l1.val + l2.val
            if val >= 10:
                if l1.next:
                    l1.next.val+=val//10
                    val%=10
                elif l2.next:
                    l2.next.val+=val//10
                    val%=10
                else:
                    dummy.next = ListNode(val%10)
                    dummy = dummy.next
                    val= val//10
            dummy.next = ListNode(val)
            dummy = dummy.next
            l1 = l1.next
            l2 = l2.next

        dummy.next = l1 if self.make_single_digit_val_node(l1) else self.make_single_digit_val_node(l2)

        return tmp_head.next

# Time complexity: O(MAX(N,M))
# Space complexity including the res: O(MAX(N,M))       

# Approach 2


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:

    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        head = None
        temp = None
        res = 0

        while l1 or l2 or res:
            val1 = l1.val if l1 else 0
            val2 = l2.val if l2 else 0

            total = val1 + val2 + res
            res = 0

            if total>9:
                res = 1
                total-=10

            Node = ListNode(total)
            if head is None:
                head = Node
                temp = head
            else:
                temp.next = Node
                temp =temp.next

            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next
                    
        return head

    
# Time complexity: O(MAX(N,M))
# Space complexity including the res: O(MAX(N,M))   