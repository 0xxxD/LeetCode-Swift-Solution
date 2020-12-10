 import Foundation

 
// func swap<T: Comparable>(leftValue: inout T, rightValue: inout T) {
//     (leftValue, rightValue) = (rightValue, leftValue)
// }

 func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int, ascending: Bool) -> Int {
    var q = startIndex
    for index in startIndex..<endIndex {
        if ascending == true ? (array[index] < array[endIndex]) : (array[index] > array[endIndex]) {
            array.swapAt(q, index)
            q += 1
        }
    }
    array.swapAt(q, endIndex)
    return q
}

 func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int, ascending: Bool) {
     // Base case
    if startIndex >= endIndex {
        return
    }
    let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex, ascending: ascending)
    quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1, ascending: ascending)
    quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex, ascending: ascending)
 }

 func quickSort<T: Comparable>(array: inout [T], ascending: Bool) {
    quickSort(array: &array, startIndex: 0, endIndex: array.count-1, ascending: ascending)
 }


 var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
// quickSort(array: &numbers, ascending: true)
// numbers

// topK

 extension Array where Element: Comparable {
    static func partition(array: inout Self, startIndex: Index, endIndex: Index, ascending: Bool) -> Int {
       var q = startIndex
       for index in startIndex..<endIndex {
           if ascending == true ? (array[index] < array[endIndex]) : (array[index] > array[endIndex]) {
               array.swapAt(q, index)
            array
               q += 1
           }
       }
       array.swapAt(q, endIndex)
       return q
   }
    
    func topMaxUsingQuickSort(_ k: UInt) -> Self? {
        if count <= k {
            return self
        }
        guard k > 0 else {
            return nil
        }
        var variableArr = self
    
        quickSort(array: &variableArr, startIndex: 0, endIndex: variableArr.count-1, targetK: k)
        return variableArr.prefix(upTo: Int(k)).map { $0 }
    }
    
    func quickSort(array: inout Self, startIndex: Int, endIndex: Int, targetK: UInt) {
        // Base case
       if startIndex >= endIndex {
           return
       }
        let placedItemIndex = Self.partition(array: &array, startIndex: startIndex, endIndex: endIndex, ascending: false)
        if placedItemIndex > targetK {
            quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1, targetK: targetK)
        } else if placedItemIndex == targetK {
            return
        } else if placedItemIndex < targetK {
            quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex, targetK: targetK - UInt(placedItemIndex))
        }
    }

 }
 
 
 numbers.topMaxUsingQuickSort(3)
 
 numbers.topMaxUsingQuickSort(1)
