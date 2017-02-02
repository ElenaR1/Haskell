(define tree (list 1(list 2 '() '())(list 3 (list 4 '() '()) '())))
(define tree1 '(1 ( 2 () ()) ( 3 (4 (5 () ()) ()) () ))) ;taka raboti
(define tree2 '(1 () ()))
 
(define (root tree)
           (car tree))
(define (left-subtree tree)
           (car (cdr tree)));cadr
(define (right-subtree tree)
           (car (cdr (cdr tree))));caddr
(define (empty? tree)
    (null? tree))

(define  (member-tree? tree x)
         (if (empty? tree) #f
	  (if (= (root tree) x) #t
	   (or (member-tree? (left-subtree tree) x) (member-tree? (right-subtree tree) x)))))
; s cond
(define  (member-tree?? tree x)
         (cond ((empty? tree) #f)
	  ((= (root tree) x) #t)
	   (else (or (member-tree? (left-subtree tree) x) (member-tree? (right-subtree tree) x)))))
	   
 (define (leaf? tree)
          (and (not (empty? tree))
	     (empty? (left-subtree tree))
	     (empty? (right-subtree tree))))
	     
(define (member-leaf? tree x)
          (if (empty? tree) #f
	    (if (and (= x (root tree)) (leaf? tree))
	    #t
	     (or (member-leaf? (left-subtree tree) x) (member-leaf? (right-subtree tree) x)))))

;week 6
(define (path-from-to first second tree)
          (if (empty? tree) #f
	   (if (= (root tree) first)
	     (member-tree? tree second); ako tova e true sledovatelno sushtestvuva put. Imame put ot a do b samo ako a e koren na durvoto v koet;o e b
	     (or (path-from-to first second (left-subtree tree))
	      (path-from-to first second (right-subtree tree))))))


(define matrix '((1 2 3) (4 5 6) (7 8 9)))
; Или малко по-красиво подреждане
(define matrix1 '((12 3 25)
                        (3 5 10)
                        (15 7 29)))
			
(define (list-ref l n)
         (cond ((> n (- (length l) 1)) (display "index out of range")); zashtot zapochva da broi ot 0
	   ((= n 0) (car l));ako e naprimer '(1 2 3) n ne trqbva da e >2
	     (else (list-ref (cdr l) (- n 1)))))
	     
(define (get-nth-row matrix n) 
         (list-ref matrix n))

(define (get-nth-col matrix n)
            (if (null? matrix) '()
	      (cons (list-ref (car matrix) n)  (get-nth-col (cdr matrix) n))))

(define (primary-diagonal matrix)
    (define (diagonal-helper matrix i)
        (if (= i (length matrix))
            '()
            (cons (list-ref (get-nth-row matrix i) i)
                  (diagonal-helper matrix (+ i 1)))))
    (diagonal-helper matrix 0))
