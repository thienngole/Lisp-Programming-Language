;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;fizz_buzz: calls function helper.

(defun fizz_buzz()

  (helper 1)
)


;;helper: creates a list of integers from one through twenty. If the number is divisible by three, 
;;output a sublist containing the number and the word fizz; for those divisible by five create a 
;;sublist containing the number and the word buzz; and for those divisible by both three and five 
;;create a sublist with three elements, the number followed by the words fizz and buzz.
;;
;;parameters:
;;   i - upper limit

(defun helper(i)

  (cond( (> i 20) ())

       ( (and (= (mod i 3) 0) (= (mod i 5) 0)) 
         (cons (list i 'Fizz 'Buzz) (helper (+ 1 i))) ) 

       ( (= (mod i 3) 0) 
         (cons (list i 'Fizz) (helper (+ 1 i)) ) ) 

       ( (= (mod i 5) 0) 
         (cons (list i 'Buzz) (helper (+ 1 i)) ) )

       (t (cons i (helper (+ 1 i) ) ) )
   )
)

;;test plan for adder:
;;category/description             data        expected result
;;------------------------------------------------------------------------------------------
;;range of 1-20                     20        (1 2 (3 FIZZ) 4 (5 BUZZ) (6 FIZZ) 7 8 (9 FIZZ) 
;;                                            (10 BUZZ) 11 (12 FIZZ) 13 14 (15 FIZZ BUZZ) 16 
;;                                            17 (18 FIZZ) 19 (20 BUZZ))
