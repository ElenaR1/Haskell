(define (accumulate term op null-value a next b)
    (if (> a b) null-value
       (op (term a)(accumulate term op null-value (next a) next b)))) 
 
	sum of odd numbers
(define (term-1 x) x)	
 (define (next-1 n) (+ n 2)) 

 (define (s a b) (if (odd? a) (accumulate term-1 + 0 a next-1 b)
         (accumulate term-1 + 0 (+ a 1) next-1 b)))


(define (cube-sum a b) (sum cube a inc b))
 
(define (sum term a next b)
        (if (> a b) 0
          (+ (term a) (sum term (next a) next b))))      
(define (cube x) (* x x))
 
(define (inc x) (+ x 1))


; (a 4) ->16
(define (compose f g a) (f (g a)))
(define (add1 x) (+ x 1))
(define (square x) (* x x))
(define (add1-then-square a)  (compose square add1 a))
(define a (lambda (x) (* x x)))
       
(define (cube-sum a b)
        (accumulate (lambda (x) (* x x)) + 0 a (lambda (x ) (+ x 1)) b))
	
(define c-s (lambda (a b)
        (accumulate (lambda (x) (* x x)) + 0 a (lambda (x ) (+ x 1)) b)))

DOMASHNO:	  
;1 zad	  
(define (factorial n)
  (*factorial n 1))
  (define (*factorial n acc)
    (if (zero? n)
        acc
        (*factorial (- n 1) (* acc n))))
 
(define (choose n k)
  (/ (factorial n) (* (factorial k) (factorial (- n k)))))
  
 ;ILI PROSTO:
(define fact (lambda (x)
        (if (zero? x) 1
	  (* x (fact (- x 1))))))

  (define (ch n k)
  (/ (fact n) (* (fact k) (fact (- n k)))))
  
  
  (define (right-most-digit num)
         (remainder num 10))
;;Returns all digits except the right-most of n.   
;2 zad
(define (all-but-right num)
         (quotient num 10))
     
  (define (des-order a)
	  (if (< a 10) #t
            (if (<= (right-most-digit a) (right-most-digit (all-but-right a))) (des-order (all-but-right a))
	     #f)))

;3 zad
(define (rel a b) 
     (if (< a b) #t
      #f))
      
(define (f a) (- a 2));ako e + a 2 shte ni dade false ako x e  1
(define (next a) (+ a 1))


(define (found? f a next b rel x)
      (cond ((> a b) #f)
	((rel (f a) x) #t); dali ima pone edin
	 (else (found? f (next a) next b rel x))))
	 
(define (func n x) (found? f 0 next n rel x));naprimer n=5 x=6. a-2 vinagi shte e po-malko ot 6


;4zad

 (define (divis n x) (check? n x 1))
  (define (improve a ) (+ a 1))
    (define (check? n x i)
    (if (> i n);da spira kogato i nadmine n
          #f
      (if (= (remainder (+ (expt i 2) (* 3 i n) (* n n)) x) 0) #t
           (check? n x (improve i)))))
	    

 ;5 zad
(define (counter num)
      (if (<= num 9) 1
      (+ 1 (counter (all-but-right num)))));

(define (cross-out a k) (f a k 0 0 (counter a)))

(define (f a k count newNum numOfDigits)
	  (if (= count numOfDigits) newNum
	    (cond ((= count k) (f (quotient a 10) k (+ count 1) newNum numOfDigits))
	      ((< count k)
	      (f (quotient a 10) k (+ 1 count) (+ (* (remainder a 10) (expt 10 count)) newNum) numOfDigits))
		((> count k)
		(f (quotient a 10) k (+ 1 count)(+ (* (remainder a 10) (expt 10 (- count 1))) newNum) numOfDigits)))))

;da pitam
(define (f a k count newNum numOfDigits)
	  (if (= count numOfDigits) newNum
	    (cond ((= count k) (f (quotient a 10) k (+ count 1)))
	      ((< count k) (+ (* (remainder a 10) (expt 10 count)) newNum))
		((> count k) (+ (* (remainder a 10) (expt 10 (- count 1)) newNum)))))
		  (f (quotient a 10) k (+ 1 count))); vmoje bi ne gleda kakvo ima nadolu vuv vfinkciqta sled kato vleze v edin ot if-ovete, a prosto se izpulnqva tova v if-a-Da

;6 zad
;tova raboti no proverqva samo vsqko da e razlichno ot slevashtoto
(define (dif a) (dif-helper a))

(define (dif-helper a)
           (if (< a 10) #t
	     (if (not (= (remainder a 10) (remainder (quotient a 10) 10))) (dif-helper (quotient a 10))
	      #f)))
;6zad istinska
; no ne raboti za 2 nuli edna sled druga e.g 300
(define (contains-digit n d) 
	    (if (< n 1) #f; ako e naprimer 321 i 3 shte si dade true no ako e 321 i 5 3/10=0 < 1
	      (if (= (remainder n 10) d) #t
	        (contains-digit (quotient n 10) d))))
(define (helper n temp i)
          (cond ((< n 1) #t)
	    ((contains-digit temp (remainder n 10)) #f)
	      (else (helper (quotient n 10) (+ temp (* (remainder n 10) (expt 10 i))) (+ i 1)))))
(define (func n) (helper n 0 0))


;po lesno i pravilno: 
(define (f n)
  (if (< n 10) #t
    (if (contains-digit (quotient n 10) (remainder n 10)) #f
      (f (quotient n 10))))) 

;obqsnenie na trudnoto
ako n=321
(helper 321 0 0)-> (contains-digit? 0 1)->f -->
(helper 32 1 1)->(contains-digit? 1 2)->f
->(helper 3 21 2)->(contains-digit? 21 3) (21 e n a 3 e d)->(if =(remainder 21 10) 3)->f i posle pak->f
->(helper 0 321 3)->t

ako n=3213
(helper 3213 0 0)-> (contains-digit? 0 3)->f -->
(helper 321 3 1)->(contains-digit? 3 1)->f
->(helper 32 13 2)->(contains-digit? 13 2) (13 e n a 2 e d)->(if =(remainder 13 10) 2)->f i posle pak->f
->(helper 3 213 3)->(contains-digit? 213 3)-> (if =(remainder 213 10) 3)->t 
->f

;7
(define (term a) a)
(define (fact-accum n) 
        (accumulate term * 1 1 next n))		
(define (fact-ac n) (accumulate (lambda (x) x) * 1 1 (lambda (x) (+ x 1)) n))

;8	
(define (expt-accum x n) 
           (define (id a) x)
         	   (accumulate id * 1 1 next n))

(define (expt-accum x n)
    (accumulate * 1 (lambda (a) x) 1 (lambda (x) (+ x 1)) n))
;9

(define (find-sum n) (func-sum f n))
(define (func-sum f n)
         (accumulate f + 0 0 next n))
(define (f a) (* a a))






4-to DOMASHNO I UPRAJNENIE
;(define l '(1 2 (3 4 5) (6 (7 8)))); ako e s quote-s ne stava
;(define l (list 1 2 (list 3 4 5) (list 6 (list 7 8)))) i taka stava
(define (f) (car (cdr (car (cdr (cdr l))))) ); za da vzema 4
(define (g) (car(car(cdr(cdr (cdr l)))))  );za da vzema 6

LISTS OT 3-TATA SEDMICA
;1zad a
  (define (len l) (len-helper l 0))
  (define (len-helper l count)
       (cond ((null? l) count)
         (else (len-helper (cdr l) (+ 1 count)))))
	 ;b
(define (my-length l);e.g '(1 (2 3))
  (cond ((null? l) 0)
        ((list? l) (+ (my-length (car l)) (my-length (cdr l))));vliza i vijda che cqloto e list vzema duljinata samo na 1 + dulj na (2 3)
	;koqto e 1+1
        (else 1))) 
  
  ;2 zad a
(define (member? l x); v konzolata pisha (lst '(1 2 3) 3)
              (if (null? l) #f
	         (if (= (car l) x) #t
		    (member? (cdr l) x))))
	;b	    
(define (member-deep l x)
         (cond ((null? l) #f)
	     ((not (list? (car l))) (if (= (car l) x) #t (member-deep (cdr l) x)))
	       ((list? (car l)) (or (member-deep(car l) x) (member-deep (cdr l) x)))))	
;3 zad

(define (list-to-num l) (list-to-num-helper l (-(len l) 1) 0))
(define (list-to-num-helper l k newNum)
          (if (null? l) newNum
	    (list-to-num-helper (cdr l) (- k 1) (+ (* (car l) (expt 10 k)) newNum))))

;i produljavame s lists ot 4tata semica
  ;4 zad
(define (reverse l)
         (if (null? l) '() 
	   (append (reverse (cdr l)) (list (car l)))))
	   
	   
;5 zad	 
(define (all-ints? l )
               (if (null? l) #t
	         (if (integer? (car l)) (all-ints? (cdr l))
		    #f)))
(define (al l)
       (cond ((null? l) #t)
         ((integer? (car l)) (al (cdr l)))
	   (else #f)))
;6 zad
(define (append? l m)
 (if (null? l) m
  (cons (car l) (append? (cdr l) m))))
  
;7 zad
(define (list-ref l k) (list-ref-helper l k 0))
(define (list-ref-helper l k count)
         (cond ((< count k) (list-ref-helper (cdr l) k (+ 1 count)))
	   ((= count k) (car l))))
	   
;8 zad
(define (list->string l) 
         (if (null? l) ""
	  (string-append (car l) " " (list->string (cdr l)))))
	  
;MAP
(define (f x) (+ x 3))
(define (map f l)
          (if (null? l) '()
	     (cons (f (car l)) (map f (cdr l)))))
	     
(define m (lambda (l)
           (if (null? l) '()
	      (cons (+ (car l) 1) (m (cdr l))))))	     	     
	     ;??? ne raboti
(define (mapp l)
           (if (null? l) '()
	     (cons (lambda (car l) (+ (car l) 1)) (mapp (cdr l)))))

PRAVILNO POLKZVANE NA MAP
(define (mapp l)
           (if (null? l) '()
         (cons ((lambda (p) (+ p 1)) (car l)) (mapp (cdr l)))))

	     
(define (func a) (string-append a "."))
(define (map1 l); a moje i da sloja func kato argumenti na konzolata da pisha: (map1 func '("ab" "cd")) no ne e nujno
           (if (null? l) ""
	      (cons (func (car l)) (map1 (cdr l)))))
;FILTER
(define (odd a) 
         (if (= (remainder a 2) 0) #f 
	   #t))
(define (filter l)
         (if (null? l) '()
	   (if (odd (car l)) (cons (car l) (filter (cdr l)))
	     (filter (cdr l)))))
	     
(define (filter-even l)
         (if (null? l) '()
	   (if (even? (car l)) (cons (car l) (filter-even (cdr l)))
	     (filter-even (cdr l)))))

(define (filter-list l)
         (if (null? l) '()
	   (if (list? (car l)) (cons (car l) (filter-list (cdr l)))
	     (filter-list (cdr l)))))
	     


4TA SEDMICA ACCUMULATE ZADACHI I OT UPRAJNENIETO
 ;zadachi ot uprajnenieto
(define (acc term op nullvalue a next b)
              (if (> a b) nullvalue
	        (op (term a) (acc term op nullvalue (next a) next b))))
		
 ;1+ x/1 +x^2/2!+....+x^n/n!
 (define (func x n) (define (term1 a) (/ (expt x a) (fact a)))
               (acc term1 + 0 0 next n))

 (define (next a) (+ a 1))
(define (next2 a) (+ a 2))
(define (term a) a)
(define (fact n) (acc term * 1 1 next n))

4TO DOMASHNO
(define (acc term op nullvalue a next b)
              (if (> a b) nullvalue
	        (op (term a) (acc term op nullvalue (next a) next b))))

;8zad ako imame umnojenie v subirane
;e.g ((2*1-1)/2) +( ((2*1-1)/2) *((2*2-1)/2*2) ) ako p=2 1/8
(define (func1 p)
          (define (term2 l) 
	    (define (term3 l)
	      (* (expt (- 1) (- l 1)) (/ (- (* 2 l) 1) (* 2 l))))
	         (acc term3 * 1 1 next l))
		     (acc term2 + 0 1 next p))
		     
; ako e s faktorieli e.g (2n-1)!/(2n)!	ako p =2 1/4	     
(define (term4 l) (* (expt (- 1) (- l 1)) (/ (fact(- (* 2 l) 1)) (fact (* 2 l)))))
(define (func1.2 p) 
          (acc term4 + 0 1 next p))

;9 zad
;k ot uslovieto mi e 'a' v accumulate. Za da mi trugne zaduljitelno trqbva da si napisha (define (term a) a) nqkude
(define (f x p)
         (define (term5 l)
	   (* (expt (- 1) (- l 1)) (/ (fact l) (/(fact (+ x l)) (fact x)))))
	    (acc term5 + 0 1 next p))
;10 zad
(define (term1 k) (/ (fact (* 3 k)) (* (expt (fact k) 3) (expt 4 (* 3 k)))))
(define (ff p) (acc term1 + 0 1 next p))

 ;12 zad
(define (func3 x p) ; pri (func3 1 2)= 13/48
          (define (term2 l)
      (define (term3 l)
      (* (expt (- 1) l) (/ (expt x (* 2 l)) (fact (* 2 l))))); bukvata l
      (acc term3 + 0 0 next l))
        (acc term2 * 1 1 next p))

;13 zad
(define (ff x p)
	  (define (term2 k)
	     (define (term3 k)
	        (* (expt (- 1) k) (/ (expt x (+ (* 2 k) 1)) (fact (+ (* 2 k) 1)))))
		  (acc term3 + 0 0 next k))
		 (acc term2 * 1 1 next p))


;1/a+1/(a+1)+...+1/b
(define (term a) (/ 1 a))
(define (next a) (+ a 1))
(define (accumulate op term null-value a next b)
    (if (> a b)
        null-value
        (op (term a) (accumulate op term null-value (next a) next b))))
(define (f a b) (accumulate + term 0 a next b))

((a+1)..(a+m))/(n+1)+((a+1)..(a+m))/(n+1)*(n+2)+((a+1)..(a+m))/(n+1)*(n+2)*...(n+m)
(define (accumulate operation null-value term a next b)
    (if (> a b)
        null-value
        (op (term a) (accumulate operation null-value term (next a) next b))))
(define (next a) (+ a 1))

(define (f1 a m);chislitel
(define (term  i) (+ a i));veche sme definirali a v gornata f-q f1 i ne e nujno da q podavame na term
(accumulate (* 1 term 1 next m)))

(define (f2 n m);znamenatel
(define (term1 i) (+ n i))
 (accumulate (* 1 term1 1 next m)))
 
 (define (term a) a)
(define (func a m n)
(define (term2 i) (/ (f1 a m) (f2 i m)))
;(define (next1) (/ (f1 a m) (f2 (+ n 1) m)))
          (accumulate + 0 term2 1 next n))
