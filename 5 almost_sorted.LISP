;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;almost_sorted: determines whether the list is almost sorted or not. 
;;parameters:
;;   list - the list to check that it is almost sorted or not.
;;assumptions:
;;   the list contains no duplicates.

(defun almost_sorted( lst)
  (cond ((= (count_inversions lst) 0) nil)
        ((< (count_inversions lst) (* 0.2 (length lst))))
  )
)

;;test plan for almost_sorted:
;;category/description          data                           expected result
;;-------------------------------------------------------------------------------------------
;;the fully sorted list        (1 2 3 4 5 6 7 8 9)             nil
;;the almost sorted list       (1 2 3 4 5 6 7 9 8)             t
;;the unsorted list            (9 8 7 6 5 4 3 2 1)             nil

(setf data1 '(1 2 3 4 5 6 7 8 9))
(setf data2 '(1 2 3 4 5 6 7 9 8))
(setf data3 '(9 8 7 6 5 4 3 2 1))
(setf data4 '(11 22 33 44 55))
(setf data5 '(1 2 4 3))
(setf data6 '(1 2 4 3 5))
(setf data7 '(1 2 4 3 5 6))
(setf data8 '(1 2 7 4 9 1 13 15 19 20 21 22))
(setf data9 '(1 -7 3 4 5 17 16 0 22 33))

;;count_inversions: counts the number of inversions in a list.
;;parameters:
;;   list - the list that may have inversions.
;;assumptions:
;;   this function only works for the list of numbers. 

(defun count_inversions(lst)

  (cond((<(length lst) 2) 0)

       ((> (car lst) (car(cdr lst))) 
        (+ 1 (count_inversions (cdr lst)) ) )

       (t (count_inversions (cdr lst)))
   )
)

;;test plan for count_inversions:
;;category/description                         data                           expected result
;;-------------------------------------------------------------------------------------------
;;the list has less than 2 elements        (2)                                     0
;;the list has inversion at the beginning  (2 1 3 4 5 6 7 8 9)                     1
;;the list has inversion at the end        (1 2 3 4 5 6 7 9 8)                     1
;;the list has more than two inversions    (1 3 2 4 6 5 7 9 8)                     3

(setf inversion_data1 '(2))
(setf inversion_data2 '(2 1 3 4 5 6 7 8 9))
(setf inversion_data3 '(1 2 3 4 5 6 7 9 8))
(setf inversion_data4 '(1 3 2 4 6 5 7 9 8))
(setf inversion_data5 '(4))
(setf inversion_data6 '(7 8 9 10))
(setf inversion_data7 '(1 2 3 5 4 6 7 8))
(setf inversion_data8 '(5 4 3 2 1))
