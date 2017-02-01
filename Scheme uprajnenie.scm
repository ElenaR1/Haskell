(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeat f n)
    (if (= n 1)
        f
        (compose f (repeat f (- n 1)))))

(define add3 (repeat ((lambda (x) (+ x 1)) 2) 3))

(define (add1 x) (+ x 1))
(define (square x) (* x x))
(define add1-then-square (compose square add1))

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


(define sauce
    (let ((x 5)
          (y 2)
	   (z 6))
	   (+ x y z)))
	   
(define f
   (let* ((x 7)
	    (y (+ x 3))
	     (z (+ x y)))
	      (+ x y)))
