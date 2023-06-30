; (free #b1111111111)             ; alloc 1024 cells
; (alloc free)  == (alloc free 0)
; (alloc free 0)                  ; alloc 1 cell at any available address and return address
; (alloc free 1)                  ; alloc 2 cells with mask #b000001 and return addres list
; (use free '(511 512 515))       ; mark cells 511 512 515 as used
; (left-free free) = 15           ; 15 cells left
; (non-free free) = 1009          ; 1009 cells occupied
; always succeed, (error ) if no available
#lang racket/base
(define EQ eq?)
(define T #t)
(define NIL '())

(define (show . w)
  (map display w)
  (newline)
  (car w))

; count cells used by tree
(define (tree-size acc t)
  (cond
    [(null? t) acc]
    [(not (pair? (car t))) (tree-size (+ 1 acc) (cdr t))]
    [#t (tree-size (+ 1 acc) (cons (car (car t)) (cons (cdr (car t)) (cdr t))))]))

;;;;;;;;;;;;;;;;;;;;
(define (make-tree n r)
  (if (= 0 n) r
      (make-tree (- n 1) (cons r r))))

(define (use tree addr)
  (cond
    ((eq? NIL tree) (error "addr not available"))
    ((eq? NIL addr) NIL)
    (#t
     (let ((newt
           (if (eq? (car addr) T)
     (if (eq? T tree)
         (cons T (use T (cdr addr)))
         (cons (car tree) (use (cdr tree) (cdr addr))))

;    ((eq? (car addr) NIL)
     (if (eq? T tree)
         (cons (use T (cdr addr)) T)
         (cons (use (car tree) (cdr addr)) (cdr tree)))
     ))) (if (and (eq? (car newt) NIL)
                (eq? (cdr newt) NIL)) NIL newt)
           ))))

(define (check tree addr t)
  (let ((res (alloc tree addr)))
    (if res
        (cons t res)
        #f
        )))


(define (alloc tree addr)
  
  (cond
    ((eq? NIL tree) #f)
    ((eq? T tree) addr)
    ((eq? NIL addr) NIL)
    (#t
     (or
      (check (cdr tree) (cdr addr) T)
      (check (car tree) (cdr addr) NIL)
      #f)
     )))
;;;;; tests
;(define one (make-tree 2 T))
(define one T)
;one
;(use one ())
;(use one (list T))
;(use one (list 0))
;(use one (list T NIL))
;(use (use one (list T NIL)) (list T NIL))
;(alloc (use one (list T NIL)) (list T NIL))
(define (walk tree used)
  (if
   (eq? NIL tree) (cdr used)
   (let* ((u (use tree (car used)))
          (a (alloc u (car used))))
     (show (tree-size 0 u)  " alloced:" a )
     (walk u (cons a used)))))
;(define alls (walk T (list (list T T T T T T T T T T ))))
;;;;;;;;;;;;;;;;;
(define (walke tree used mask)
  (if (eq? NIL tree) used
      (let*
          ((a (alloc tree mask))
           (u (use tree a)))
        (show u " alloced:" a )
        (walke u (cons a used) mask))))

;(define alls (walke T () (list T T T T T T T T T T )))

;alls
;(length alls)
;[length alls]   
(provide alloc use make-tree)
