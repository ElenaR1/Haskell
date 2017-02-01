#lang racket
(define (vertices graph)
  (if (null? graph) '()
    ( cons (caar graph) (vertices (cdr graph))) ))

(define (vertices2 graph)
  (map car graph))
  

(define (neighbours graph vertex)
   (if (null? graph) '()
       (if (= (caar graph) vertex) (cdar graph)
           (neighbours (cdr graph) vertex))))

(define (edges graph)
  (if (null? graph) '()
      (map func-helper graph)))

(define (func-helper lst) (func (cdr lst) (car lst)))

(define (func lst vertex)
  (if (null? lst) '()
     (cons (cons vertex (car lst)) (func (cdr lst) vertex ))))

(define (out-degree graph vertex)
  (if(null? graph) '()
      (length (neighbours graph vertex))))

(define (in-degree graph vertex)  (in-deg graph vertex 0))
(define (in-deg graph vertex c)
  (if (null? graph) c
   (if (= vertex (caar graph)) (if (member vertex (cdar graph)) (in-deg (cdr graph) vertex (+ 1 c)) (in-deg (cdr graph) vertex c))
     (if (member vertex (car graph)) (in-deg (cdr graph) vertex (+ 1 c))
       (in-deg (cdr graph) vertex c)))))

;ili
(define (in-degree* vertex graph)
  (define (vertex-occurences lst)
    (length (filter (lambda (v) (equal? vertex v)) (cdr lst))))
  (define (vertex-occurences-all graph) ;the 'graph' used here is NOT the graph from above. This is a local binding to the vertex-occurences-all function.
    (map vertex-occurences graph))
  (fold-left + 0 (vertex-occurences-all graph))) ;the 'graph' used here IS the graph from the function definition.
      
(define (sub-graph graph1 graph2) (sub-graph-helper (edges graph1) (edges graph2)))

(define (sub-graph-helper edgesgr1 edgesgr2)
  (if (null? edgesgr1) '()
      (cons (member (car edgesgr1)  edgesgr2) (sub-graph-helper (cdr edgesgr1) edgesgr2))))


;(define (any? p xs))
;(define (all? p xs)) ;using any!!! :)
(define (isItTrue lst)
  (if (null? lst) #t
      (if (car lst) (isItTrue (cdr lst))
          #f)))
(define lst (sub-graph '((1 2 3) (2 3 4) (3 1 2 4) (4 4 1)) '((2 3 4) (1 2 3) (3 1 2 5) (4 4 1)) ))
