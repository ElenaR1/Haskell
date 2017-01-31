(define (f n k)
  (if (= k 0) 1
      (if (even? k) (f (* n n) (/ k 2))
      (* n (f n (- k 1))))))
      ;s cond
(define (f n k)
  (cond ((= k 0) 1)
   ((= k 1) n)
     ((even? k) (f (* n n) (quotient k 2)))
      (else (* n (f n (- k 1))))))
      
Countdown:
 (define (func a) (cond ((= a 0) "done") (else (func (- a 1))))) ;; izpisva done

;;ako vuveda 8 shte mi dade 5 t.e 5 sa chetnite chisla ot 1 do 8 0,2,4,6,8
(define (count-even-helper a count) (cond ((zero? a) (+ count 1))
				    ((even? a) (count-even-helper (- a 1) (+ count 1)))
				    ((odd? a) (count-even-helper (- a 1) count))))
(define (count-evens a) (count-even-helper a 0))

ili s IF
(define (co a count) 
          (if (= a 0) (+ 1 count)
	    (if (even? a) (co (- a 1) (+ 1 count))
	       (co (- a 1) count))))


;; izpisva mi 1 t.k ako imame (cond ((> 4 2) 1) ((< 4 2) 0))) shte ni display-ne 1 
;; a tuk ni display-va count+1 ako tozi sluchai e izpulnen. V drugite sluchai se izvikva finkciqta


;;LIST
(define (compile-list-hepler a lst)
			  (cond ((zero? a) (append (list 0) lst))
			  (else (compile-list-hepler (- a 1) (append (list a) lst)))))
(define (compile-list a) (compile-list-hepler a '()))

;; ako vuvedem 4 naimra sbora ot chislata do 4
(define (sum-helper num sum) (cond ((zero? num) sum)
			      (else (sum-helper (- num 1) (+ sum num)))))
(define (sum-func num) (sum-helper num 0))


how to use BEGIN and multiple statements
(define (func num x)
         (if (< num x)
	    (begin 
	      (set! num (+ 1 num))
	         (set! x 0)
		    (display "uga"));na display i na begin
		     "error"); tova e else i zatvarqshta skoba na if
		     )

HOW TO USE 'OR' AND
(define (f n) 
          (if (or (= n 1) (= n 2)) #t #f))

(define (f n) 
          (if (and (< n 10) (> n 8)) #t #f)); EDINSTVENO 9 E OTGOVOR

Fact
(define (fact n) 
         (if (or (= n 0) (= n 1)) 1
	   (* n (fact (- n 1)))))

Power function

(define (f n k)
          (if (= k 0) 1
	    (* n (f n (- k 1)))))
;; A year is a leap year if it's divisible by 400, or
;; if it's divisible by 4 but not by 100.
(define (leap-year x)
           (or (and (zero? (remainder x 4)) (not (zero? (remainder x 100)))) 
	     (zero? (remainder x 400))))

(define (cir r)
    (define pi 3.14);we don't define a function but a number
       (define (area) (round (* pi r r)))
          (define (circum) (round (* 2 pi r)))
	    (list (area) (circum)))

;sum of the numbers in a list
(define (sum ls)
        (if (null? ls) 0
	   (+ (car ls) (sum (cdr ls)))))
;;multiplies by 3 each arg in the list
(define (triple ls)
            (if (null? ls) '()
	      (cons (* 3 (car ls)) (triple (cdr ls)))))	   


https://see.stanford.edu/materials/icsppcs107/30-Scheme-Functions.pdf-p 6
