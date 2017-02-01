
(define lst '(1 2 3 4 ))
; lst  func=f res=0
(define (accu lst func res)
        (if (null? lst) res
	  (accu (cdr lst) func (func res (car lst)))))
	  
(define (interval from to)
  (if (> from to) '()
    (cons from (interval (+ 1 from) to))))

(define (meetTwice f g a b)
       (> (accu (interval a b) 
         (lambda (res x) (if (= (f x) (g x)) (+ 1 res)
	   res)) 0)
	   1))
