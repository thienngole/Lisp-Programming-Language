;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;enforce_limit: creats a new list in which replaces all the values that over the limit by 
;;               the limit.
;;parameters:
;;   limit - the limited value.
;;   lst - the list to enforce the limit.
;;assumptions:
;;   the limit will be an integer.

(defun enforce_limit(limit lst)
  (cond ((null lst) nil )
        ((and (numberp (car lst)) (> (car lst) limit)) 
         (cons limit (enforce_limit limit (cdr lst))))

        ((listp (car lst)) (cons (enforce_limit limit (car lst)) 
                                 (enforce_limit limit (cdr lst))))

        (t (cons (car lst) (enforce_limit limit (cdr lst) )))
   )
)

;;test plan for enforce_limit:
;;category/description                          data                     expected result
;;------------------------------------------------------------------------------------------
;;empty list                                    5 '()                     nil
;;list of all element greater than the limit    1 '(2 3 4 5 6 7 8 9)     (1 1 1 1 1 1 1 1 )
;;list of some element greate than the limit    4 '(1 2 3 4 5 6 7 8 9)   (1 2 3 4 4 4 4 4 4)
;;list of non element greater than the limit    9 '(1 2 3 4 5 6 7 8)     (1 2 3 4 5 6 7 8)

(setf data1 '(2 3 4 5 6 7 8 9))
(setf data2 '(1 2 3 4 5 6 7 8 9))
(setf data3 '(1 2 3 4 5 6 7 8))
(setf data4 '(6 2 kitty 5 -16))
(setf data5 '(1 66 2 kitty -16))
(setf data6 '(20 (35 9) 7 100 2 () 2))
(setf data7 '())

(setf limit1 '1)
(setf limit2 '4)
(setf limit3 '9)
(setf limit4 '5)
(setf limit5 '8)
(setf limit6 '33)
(setf limit7 '5)