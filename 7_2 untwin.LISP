;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;untwin: receives a list which may have paired (adjacent equal) elements, and removes one of
;;        each pair.  Pairs are defined as adjacent equal values.
;;parameters:
;;   lst - a list that may have paired elements.
;;assumptions:
;;   the list is not nested
;;   no more than two identical elements will be adjacent

(defun untwin( lst)
  (cond ((null lst) ())
        ((equal (car lst) (car (cdr lst))) (cons (car(cdr lst)) (untwin (cdr(cdr lst))) ) )
        (t (cons (car lst) (untwin (cdr lst))))
   )
)

;;test plan for untwin:
;;category/description                     data                          expected result
;;------------------------------------------------------------------------------------------
;;empty list                               ()                            nil
;;list of numbers that has no pair         (1 4 6 5 8 3 9 10 13)         (1 4 6 5 8 3 9 10 13)
;;list of numbers that has pairs           (1 2 2 3 4 5 5 8 7 7)         (1 2 3 4 5 8 7)
;;list of words that has no pair           (cat dog hot chicken)         (cat dog hot chicken)
;;list of words that has pairs             (cat cat dog hot hot chicken) (cat dog hot cicken)
;;list of numbers and words that has pairs (1 1 cat dog dog 2 5 hot hot) (1 cat dog 2 5 hot)

(setf data1 '())
(setf data2 '(1 4 6 5 8 3 9 10 13))
(setf data3 '(1 2 2 3 4 5 5 8 7 7))
(setf data4 '(cat dog hot chicken))
(setf data5 '(cat cat dog hot hot chicken))
(setf data6 '(1 1 cat dog dog 2 5 hot hot))
(setf data7 '(dog dog 2 cat 7 7))
(setf data8 '(flower  flower  bee  flower))
