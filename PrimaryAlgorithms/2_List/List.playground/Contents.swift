import Foundation
 

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


// reverse
class Solution {
    // recursive
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let p = reverseList(head?.next)
        
        head?.next?.next = head
        head?.next = nil
        return p
    }
}

var head: ListNode?
var previous: ListNode?
for i in 0..<3 {
    let current = ListNode.init(i)
    
    if head == nil {
        head = current
    }
    
    if let realP = previous {
        realP.next = current
    }
    previous = current
}

//head = Solution().reverseList(head)

// delete
extension Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let unionEle = _findNote(head, previous: nil, val: val)
        // previous
        if let previous = unionEle.1 {
            previous.next = unionEle.0?.next
        }
        unionEle.0?.next = nil
        return unionEle.0
    }
    
    private func _findNote(_ head: ListNode?, previous: ListNode?, val: Int) -> (ListNode?, ListNode?) /* (head, previous) */ {
        
        if head?.val == val {
            return (head, previous)
        }
        return _findNote(head?.next, previous: head, val: val)
    }
}

//head
//Solution().deleteNode(head, 8)
//head

extension Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        if n <= 0 {
//            return nil
//        }
//        guard let realHead = head else {
//            return nil
//        }
//        var left: ListNode? = nil
//        var right: ListNode = realHead
//        var currentOffset = 0
//        while right.next != nil {
//            right = right.next!
//            currentOffset += 1
//            if currentOffset >= n {
//                if let realLeft = left {
//                    left = realLeft.next
//                } else {
//                    left = realHead
//                }
//            }
//        }
//        return right
        guard let targetNote = _findNthFromEnd(head, n) else {
            return nil
        }
        
//        _ = deleteNode(head, targetNote.val)
        
        return nil
    }
    
    private func _delete(head: ListNode, target: ListNode) -> Bool {
        let previous: ListNode? = nil
        
        while head.next != nil {
            
        }
        
        return false
    }
    
    func _findNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n <= 0 {
            return nil
        }
        guard let realHead = head else {
            return nil
        }
        var left: ListNode? = nil
        var right: ListNode = realHead
        var currentOffset = 0
        while right.next != nil {
            right = right.next!
            currentOffset += 1
            if currentOffset >= n {
                if let realLeft = left {
                    left = realLeft.next
                } else {
                    left = realHead
                }
            }
        }
        return right
    }

    
    
}
head
Solution().removeNthFromEnd(head, 1)
