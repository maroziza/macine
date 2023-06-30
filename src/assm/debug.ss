(define (asm . z) (map (lambda (cmd) (pad #\ (slist->string cmd) 20)) (cdr (apply split! z))))
(define (link n z)  (rotate (map (lambda (x) (foldr append '() x)) (rotate z))))

;; DST SRC CONSTANT
(define ![ !)
(define ] 0)
(define s 0)

(define  ah= 'ah=)
(define  al= 'al=)
(define  bl= 'bl=)
(define  dx= 'dx=)
(define   s= 's=)
(define  pc= 'pc=)
(define out= 'out=)
(define   ]= 'RAM=)

(define dx=s 'dx=s)

(define ch   'bh)
(define cf   'cf)
(define chcl   'chcl)


(define s    's)
(define [    'RAM)
(define ah   'ah)
(define al   'al)
(define bl   'bl)
(define dx   'dx)
(define bh   'bh)


