;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;count_groups: counts the number of groups of adjacent doublicate values in a list.
;;parameters:
;;   lst - a list of atoms that may contain groups.
;;assumptions:
;;   the list contains no nested lists.

(defun count_groups(lst)

  (cond((< (length lst) 2) 0)
       
       ((equal (car lst) (car (cdr lst))) 
        (+ 1 (count_groups(eliminater(cdr lst)))))
       
       (t (count_groups(cdr lst)))   
   )
)

;;test plan for count_groups:
;;category/description                       data                             expected result
;;-------------------------------------------------------------------------------------------
;;list has less than two elements           (orchids)                             0
;;list of numbers has 0 group               (1 2 3 4 5 6 7 8 9)                   0
;;list of numbers has 1 groups              (1 2 3 4 4 5 6 7 8)                   1
;;list of numbers has more than 1 group     (1 2 2 3 4 4 5 5 6 7 7 )              4
;;list of all the same words                (sleepy sleepy sleepy sleepy)         1
(setf data1 '(orchids))
(setf data2 '(1 2 3 4 5 6 7 8 9))
(setf data3 '(1 2 3 4 4 5 6 7 8))
(setf data4 '(1 2 2 3 4 4 5 5 6 7 7 ))
(setf data5 '(sleepy sleepy sleepy sleepy))
(setf data6 '(a b c))
(setf data7 '(here kitty kitty))
(setf data8 '(happy happy joy joy))
(setf data9 '(yes no no 23 -101 yes yes yes))
(setf data10 '(7 7 7 7 7 7))

;;eliminater: passes the group and go to the next element in the list.
;;parameters:
;;   lst - a list that may contain some groups.
;;assumptions:
;;   the list contain no nested list.
;;   the list has at least 2 elements.

(defun eliminater(lst)

  (cond ((equal(car lst) (car(cdr lst))) 
         (eliminater(cdr lst)))

       (t (cdr lst))   
   )
)

;;test plan for eliminater:
;;category/description                       data                             expected result
;;-------------------------------------------------------------------------------------------
;;list has less than two elements           (orchids)                         nil
;;list has all the same elements            (cat cat cat cat)                 nil
;;list has no group                         (cat dog bird fish)               (dog bird fish)

(setf eliminater_data1 '(orchids))
(setf eliminater_data2 '(cat cat cat cat))
(setf eliminater_data3 '(cat dog bird fish))