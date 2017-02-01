//1VO DOMASHNO
;;1zad 
(define (sum-helper num1 num2 sum) (cond ((= num1 num2) (+ sum num2))
                    (else (sum-helper (+ 1 num1) num2 (+ sum num1)))))
S IF
(define (sum-helper num1 num2 sum) 
                    (if (= num1 num2) (+ sum num2)
		     (sum-helper (+ 1 num1) num2 (+ sum num1))))
                 
                 
(define (sum-func num1 num2) (sum-helper num1 num2 0))
                 
                 
(define (sum-func num1 num2) (sum-helper num1 num2 0))
			      
2 zad			      
(define (counter-func num ) (counter-helper num 0))

(define (counter-helper num count) (cond ((<  (abs num) 10) (+ 1 count))
				   (else (counter-helper (/ num 10) (+ 1 count)))))
			      			      
(define (co num) (counter-helper num 0))

S IF 
(define (fh a count) 
           (if (< a 10) (+ 1 count) 
	     (fh (quotient a 10) (+ 1 count))))
                 
                 
(define (f a) (fh a 0))

;;3 zad
(define (counter-helper num mult) (cond ((<  (abs num) 10) (* mult num))
				   (else (counter-helper (quotient num 10) (* mult (remainder num 10))))))
			      			      
(define (co num) (counter-helper num 1))

S IF
(define (counter-helper a mult)
		  (if (< (abs a) 10) (* mult a)
		    (counter-helper (quotient a 10) (* mult (remainder a 10)))))
			      			      
(define (co a) (counter-helper a 1))


;;4 zad Reverse number
;;it gives you the right-most digit of num
(define (right-most-digit num)
         (remainder num 10))
;;Returns all digits except the right-most of n.	 
(define (all-but-right num)
         (quotient num 10))
	 
 (define (counter num)
	  (if (<= num 9) 1 
	  (+ 1 (counter (all-but-right num)))));else
	  
(define (reverse num)Яъг
         (if (<= num 9) num 
	 (+ (* (right-most-digit num) (expt 10 (counter (all-but-right num))))
	 (reverse (all-but-right num)))));;tuk si prikljuchva else-a subrame gornoto s tova na tozi red
e.g 654->(+ 4*100 (+5*10 6))=456

S COND
(define (reverse num)(cond ((< num 10) num) 
                   (else (+ (* (right-most-digit num)
              		   (expt 10 (counter (all-but-right num)))) (reverse (all-but-right num))))))

;5zad Palindrome
(define (right-most-digit num)
         (remainder num 10))
	 
(define (all-but-right num)
         (quotient num 10))
	 
 (define (counter num)
	  (if (<= num 9) 1 
	  (+ 1 (counter (all-but-right num)))));else
	  
(define (reverse num)
         (if (<= num 9) num 
	 (+ (* (right-most-digit num) (expt 10 (counter (all-but-right num))))
	 (reverse (all-but-right num)))));;tuk si prikljuchva else-a subrame gornoto s tova na tozi red

	 
(define (palindrome num)
	(if (= (reverse num) num) "true" "false"))

;6zad Prime num

(define (prime n)
         (test-prime n 2))
(define (factor a b)
         (= (remainder a b) 0))
	 
(define (test-prime n i) 
         (if (> i (/ n 2)) #t
	  (if (factor n i) #f;else
	  (test-prime n (+ 1 i));else na 2riq if
	  );na 2riq if
	  ); na 1viq
	  );na define

;drug nachin
(define (isprime? n ) (prime n 2))
(define (prime n d)
	(if (> d (/ n 2))
	  #t
	  (if (= n 1);;else na 1viq if
	   #f 
	    (if (= (remainder n d) 0)
	    #f
	      (prime n (+ 1 d))))))

;Vupros???
(define (prime??? num);;
	 (if (= num 0) #f)
	  (if (= num 2) #t)
	   (if(= num 1) #f));;how to use or ??

;(define (prime?? num) (cond ((or (= num 1) (= num 0) #f) 
;		    ((= num 2) #t))))



;(if (and (> 10 5) (mnbb) () ()))

(define (prime?? num);;
     (if (and (= num 0) (= num 1)) #f )
     (if (= num 2) #t)
  )
(define (prime? num) (cond ((= num 0) #f)
                    ((= num 1) #f)
 		    ((= num 2) #t)))


//2ro domashno
;The sum of the digits of a number	   	      
(define (f a sum)
          (if (= a 0) (+ sum a)
	   (f (quotient a 10) (+ sum (remainder a 10)))))
;1
(define (num-even a) (num-even-helper a 0))
(define (num-even-helper a count)
         (cond ((< a 10 ) (if (even? a) (+ 1 count) count))
	   ((even? (remainder a 10)) (num-even-helper (quotient a 10) (+ 1 count)))
	   (else (num-even-helper (quotient a 10) count))))
;2	   
(define (num-odd a) (num-odd-helper a 0))
(define (num-odd-helper a count)
         (cond ((< a 10 ) (if (odd? a) (+ 1 count) count))
	   ((odd? (remainder a 10)) (num-odd-helper (quotient a 10) (+ 1 count)))
	   (else (num-odd-helper (quotient a 10) count))))	   	
;3
 (define (fact n)
           (if (or (= n 0) (= n 1)) 1
	     (* n (fact (- n 1)))))
	     
(define (sin-func x n sum)
           (if (= n 0) (+ x sum)
	      (sin-func x (- n 1) (+ sum (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1))))))))
; s cond	      
(define (sin-func? x n sum)
           (cond ((= n 0) (+ x sum))
	      (else (sin-func? x (- n 1) (+ sum (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1)))))))))
; po 3ti nachin	      
(define (sinn x n)
          (if (= n 0) x
	    (+ (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1))))
	     (sinn x (- n 1)))))
Vqrno (ot asistenta ):

(define (sin x)
   (define e 0.000001)
     (define (term x n)
       (* (/ (expt (- 1) n) (fact (+ (* 2 n) 1))) (expt x (+ (* 2 n) 1)))) 
       
          (define (good-enough term) 
	   (< (abs term) e))
	   
	   (define (sin-helper n)
	      (if (good-enough (term x n)) 
	       0
	        (+ (term x n) (sin-helper (+ n 1)))))
		 (sin-helper 0))
;moeto ne trugva
(define (term1 x n)
       (* (/ (expt (- 1) n) (fact (+ (* 2 n) 1))) (expt x (+ (* 2 n) 1)))) 
       (define e 0.000001)
(define (good-enough1 term) 
	   (< (abs term) e))		 
(define (sinn x) (sinh x 0))
(define (sinh x n)
       (if (good-enough1 (term1 x n)) 0
         (sinh x (+ n 1 ))))
  



//2ro domashno
;The sum of the digits of a number           
(define (f a sum)
          (if (= a 0) (+ sum a)
       (f (quotient a 10) (+ sum (remainder a 10)))))
;1
(define (num-even a) (num-even-helper a 0))
(define (num-even-helper a count)
         (cond ((< a 10 ) (if (even? a) (+ 1 count) count))
		;;(cond ((and (< a 10) (even? a)) (+ 1 count)) vmesto 1viq red koito imame mojem da slojim tezi dva
	;; ((and (< a 10) (odd? a)) count)
       ((even? (remainder a 10)) (num-even-helper (quotient a 10) (+ 1 count)))
       (else (num-even-helper (quotient a 10) count))))
;2     
(define (num-odd a) (num-odd-helper a 0))
(define (num-odd-helper a count)
         (cond ((< a 10 ) (if (odd? a) (+ 1 count) count))
       ((odd? (remainder a 10)) (num-odd-helper (quotient a 10) (+ 1 count)))
       (else (num-odd-helper (quotient a 10) count))))     
;3
 (define (fact n) ; rekursiven fact
           (if (or (= n 0) (= n 1)) 1
         (* n (fact (- n 1)))))
         
;iterirasht fact
(define (fact? n) (fact-iter n 1))
(define (fact-iter n d)
          (if (= n 0) 1
	    (if (= n 1) d
	     (fact-iter (- n 1) (* n d)))))

(define (sin-func x n sum)
           (if (= n 0) (+ x sum)
          (sin-func x (- n 1) (+ sum (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1))))))))
; s cond         
(define (sin-func? x n sum)
           (cond ((= n 0) (+ x sum))
          (else (sin-func? x (- n 1) (+ sum (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1)))))))))
; po 3ti nachin      
(define (sinn x n)
          (if (= n 0) x
        (+ (* (expt -1 n) (/ (expt x (+ 1 (* 2 n))) (fact (+ (* 2 n) 1))))
         (sinn x (- n 1)))))

      ; na asistenta   
(define (sin x)
   (define e 0.000001)
     (define (term x n)
       (* (/ (expt (- 1) n) (fact (+ (* 2 n) 1))) (expt x (+ (* 2 n) 1)))) 
       
          (define (good-enough term) 
	   (< (abs term) e))
	   
	   (define (sin-helper n)
	      (if (good-enough (term x n)) 
	       0
	        (+ (term x n) (sin-helper (+ n 1)))))
		 (sin-helper 0))
;moe ne raboti
(define (term1 x n)
       (* (/ (expt (- 1) n) (fact (+ (* 2 n) 1))) (expt x (+ (* 2 n) 1)))) 
       (define e 0.000001)
(define (good-enough1 term) 
	   (< (abs term) e))		 
(define (sinn x) (sinh x 0))
(define (sinh x n)
       (if (good-enough1 (term1 x n)) 0
         (sinh x (+ n 1 ))))
  

FIBONACCI
(define (fib n)
            (cond ((= n 0) 0)
	     ((= n 1) 1)
	      (else (+ (fib (- n 1)) (fib ( - n 2))))))
fib(5)
fib(4) + fib(3)
(fib(3) + fib(2)) + fib(3)
((fib(2) + fib(1)) + fib(2)) + fib(3)
((1 + 1) + fib(2)) + fib(3)
(2 + fib(2)) + fib(3)
(2 + 1) + fib(3)
3 + fib(3)
3 + (fib(2) + fib(1))
3 + (1 + 1)
3 + 2
5

; NE RABOTI ?
(define (fib-it n) (fib-iter n 1 1))	      
(define (fib-iter n a b)
          (if (= n 1) b
	    (fib-iter (- n 1) b (+ a b))))

;6zad
(define (dec->bin n)
           (cond ((zero? n) 0)
	    (else (+ (* 10 (dec->bin (quotient n 2))) (remainder n 2)))))
	    
	    
	    (define (to-binary n)
  (define (binary-iter n i)
    (if (< n 1)
        0
        (+
         (* (remainder n 2) (expt 10 i))
         (binary-iter (quotient n 2) (+ i 1)))))
  (binary-iter n 0))
	    
(define (bin->dec n)
  (if (zero? n)
      n
      (+ (modulo n 10) (* 2 (bin->dec (quotient n 10))))))	    
;7zad
(define (f a b)
         (cond ((and (< b 10) (= (remainder a 10) b)) #t) 
	 ((= (remainder a 10) (remainder b 10)) (f (quotient a 10) (quotient b 10)))
	 (else #f)))      

;8zad
(define (ff a b)
	(if (= b 0) a
	  (ff b (remainder a b))))
