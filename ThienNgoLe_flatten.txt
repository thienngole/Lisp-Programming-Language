;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;flatten: receives a list of arbitrary depth, and returns a list containing all the same 
;;         elements, in the same order, but now at the top level.
;;parameters:
;;   lst - a list of arbitrary depth.
;;

(defun flatten (lst)

  (cond ((null lst) ())

        ((null (car lst)) 
         (flatten (cdr lst)))

        ((atom (car lst)) 
         (cons (car lst) (flatten (cdr lst))))

        (t (append (flatten (car lst)) (flatten (cdr lst))))
  )
)

;;test plan for flatten:
;;category/description            data                              expected result
;;-----------------------------------------------------------------------------------
;;empty list                      ()                                 nil     
;;list has no sublist             (1 4 hot cool happy)              (1 4 hot cool happy)
;;list has sublist                (1 (day) night (19) hot happy)    (1 day night 19 hot happy) 
;;list has several levels sublist (1 (day) night (19) (hot (happy)) (1 day night 19 hot happy)

(setf data1 '())
(setf data2 '(1 4 hot cool happy))
(setf data3 '(1 (day) night (19) hot happy))
(setf data4 '(1 (day) night (19) (hot (happy))))
(setf data5 '())
(setf data6 '(day night))
(setf data7 '(a b (high low) ()(e (f (deep) h))))

