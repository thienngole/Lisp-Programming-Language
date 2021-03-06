;;ThienNgo Nguyen Le-CS 3210-Fall 2017
;;==========================================================================================
;;sort_by_recency: adds a word to the beginning of a list then delete that word at other
;;                 position on the list.
;;parameters:
;;   word - the word to add or change position.
;;   list - the list to add or change the word position.
;;assumptions:
;;   the incoming list has no duplicates.

(defun sort_by_recency(word lst)
  (cons word (make_recent word lst ))

)

;;test plan for sort_by_recency:
;;category/description                               data                 expected result
;;-------------------------------------------------------------------------------------------
;;the word and list does not contain the word     hot '(cold  warm  nice) (hot cold warm nice)
;;the word and list has the word at the begining  hot '(hot cold warm)    (hot cold warm)
;;the word and list has the word in the middle    hot '(cold hot warm)    (hot cold warm)
;;the word and list has the word at the end       hot '(cold warm hot)    (hot cold warm)
 
(setf word_list1 '(cold  warm  nice))
(setf word_list2 '(hot cold warm))
(setf word_list3 '(cold hot warm))
(setf word_list4 '(cold warm hot))
(setf word_list5 '(a cat came in))
(setf word_list6 '(cat dog tree))

(setf word1 'hot)
(setf word2 'hot)
(setf word3 'hot)
(setf word4 'hot)
(setf word5 'cat)
(setf word6 'boy)

;;make_recent: find the words on the list and delete them all.
;;parameters:
;;   word - a word to delete
;;   lst - a list to find the word
;;assumptions: no assumption

(defun make_recent(word lst)
  (cond((null lst) ())
       ((equal word (car lst)) (make_recent word (cdr lst)) )
       (t (cons (car lst) (make_recent word (cdr lst))))

   )
)

;;test plan for make_recent:
;;category/description                          data                           expected result
;;--------------------------------------------------------------------------------------------
;;the word and the empty list                  cat '()                          nil
;;the word and list contains the word          cat '(cat dog cat bird chicken) (dog bird chicken)
;;the word and the list only contains the word cat '(cat cat cat cat)           nil

(setf word_list7 '())
(setf word_list8 '(cat dog cat bird chicken))
(setf word_list9 '(cat cat cat cat))

(setf word7 'cat)
(setf word8 'cat)
(setf word9 'cat)