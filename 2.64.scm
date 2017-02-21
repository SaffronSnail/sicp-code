; For part a, I will describe the partial-tree algorithm step-by-step in English:
; 1. If the caller requested no elements be tree-ified, return a pair
;    consisting of the empty list and the given elements
; 2. Create the left tree by taking the first n/2 elements and recursing over
;    them
; 3. Create the right half of the tree by taking all the elements not taken in
;    step 2, except for the first one, and recursing over them
; 4. Create the tree using the subtrees in steps 2 and 3, using the element that
;    was excepted in step 3 as the value of the root node

; b)
; This algorithm is O(n). The list is already sorted, so we can place each node
; in the 'correct' position without having to compare it to any other nodes.

