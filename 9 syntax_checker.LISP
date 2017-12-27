;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;syntax_checker: calls three helper functions (tokens_checker, operands_checker, and 
;;                operator_checker) to check the syntax of a list of expressions.
;;parameters:
;;   lst - a list of expressions.
;;assumptions:
;;   this function only works for three errors: wrong number of tokens, operands are not numeric,
;;   and invalid operator(the operators are the actual words).

(defun syntax_checker( lst)
  (and (tokens_checker lst)
       (operands_checker (car lst))
       (operator_checker (car(cdr lst)))
       (operands_checker (Car(cdr(cdr lst))))
   
   )
)

;;test plan for syntax_checker:
;;category/description                  data                                expected result
;;--------------------------------------------------------------------------------------------
;;list has no sublist and no errors (2 plus 3)                              t
;;list has sublists and no errors   ((2 minus 1) times (20 dividedby 2))    t
;;list has wrong number of tokens   ((2 minus 1) times (dividedby 2))       nil
;;list has opreands not numeric     (cat plus dog)                          nil
;;list has invalid operator         ((2 - 1) times (20 / 2))                nil
;;liist has several errors          ((2 - 1) times (dividedby cat))         nil

(setf data1 '(2 plus 3))
(setf data2 '((2 minus 1) times (20 dividedby 2)))
(setf data3 '((2 minus 1) times (dividedby 2)))
(setf data4 '(cat plus dog))
(setf data5 '((2 - 1) times (20 / 2)))
(setf data6 '((2 - 1) times (dividedby cat)))
(setf data7 '(7 plus 11))
(setf data8 '(25 minus (17 times 12)))
(setf data9 '((100 plus 200) minus (17 times 5)))
(setf data10 '(-4 plus))
(setf data11 '(-22 plus (cat minus dog)))
(setf data12 '((7 + 3) minus 12))
(setf data13 '(-4 plus (cat minus dog)))

;;==========================================================================================
;;tokens_checker: check the number tokens in an expression and returns t if
;;                it is three otherwise returns nil. 
;;parameters:
;;   llst - the list of expressions.

(defun tokens_checker (lst)
  (cond ((null lst) nil)
        ((equal (length lst) 3) T)
        (t nil)
  )
)

;;test plan for tokens_checker:
;;category/description                  data                                 expected result
;;------------------------------------------------------------------------------------------
;;empty list                      ()                                         nil
;;list has two elements           (dog cat)                                  nil
;;list has more than 3 elements   (dog plus cat times hotdog)                nil
;;list has exactly 3 elements     (dog plus cat)                             t

(setf token_data1 '())
(setf token_data2 '(dog cat))
(setf token_data3 '(dog plus cat times hotdog))
(setf token_data4 '(dog plus cat))

;;==========================================================================================
;;operands_checker: determines wether an element is a number or not.
;;parameters:
;;   item - an element to check if it is a number or not.

(defun operands_checker (item)
  (cond ((numberp item) T)

        ((listp item) (syntax_checker item))
        (t nil)
   )
)

;;test plan for operadns_checker:
;;category/description                  data                                expected result
;;------------------------------------------------------------------------------------------
;;a number                              99                                     t
;;a word                               sleepy                                  nil

(setf operand_data1 '99)
(setf operand_data2 'sleepy)

;;==========================================================================================
;;operator_checker: determines whether an element is a valid operator or not.
;;parameters:
;;   item - an element to check.
;;assumptions:

(defun operator_checker(item)
  (cond ((or (equal item 'plus) (equal item 'minus) 
             (equal item 'times) (equal item 'dividedby)) T)

        (t nil)
   )
)

;;test plan for operator_checker:
;;category/description                  data                                expected result
;;-----------------------------------------------------------------------------------------
;;operator word: plus                  plus                                 t
;;operator word: minus                 minus                                t
;;operator word: times                 times                                t
;;operator word: dividedby             dividedby                            t
;;operator sign: +                     +                                    nil
;;operator sign: -                     -                                    nil
;;operator sign: *                     *                                    nil
;;operator sign: /                     /                                    nil
;;a word: cat                          cat                                  nil

(setf operator_data1 'plus)
(setf operator_data2 'minus)
(setf operator_data3 'times)
(setf operator_data4 'dividedby)
(setf operator_data5 '+)
(setf operator_data6 '-)
(setf operator_data7 '*)
(setf operator_data8 '/)
(setf operator_data9 'cat)

