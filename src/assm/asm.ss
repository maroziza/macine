
(define (asm . z)  (map (lambda (x) (hex (apply bitwise-ior x))) (cdr (apply split! z))))
(define (link n z) (map (lambda (x) (foldr append '() x)) (rotate z)))
	 
(define ![ !)
(define ] 0)
(define s 0)

;;              DST SRC CONSTANT
(define  ah= #b0000000000000000)
(define  al= #b0010000000000000)
(define  bl= #b0100000000000000)
(define  dx= #b0110000000000000)
(define   s= #b1000000000000000)
(define  pc= #b1010000000000000)
(define out= #b1100000000000000)
(define   ]= #b1110000000000000)

(define ch=   #b0000000000000000)
(define cf=   #b0000000000000000)
(define chcl= #b0000000000000000)

(define dx=s #b010100000000000)

(define [    #b0001000000000000)
(define ah   #b0000100000000000)
(define al   #b0000010000000000)
(define bl   #b0000001000000000)
(define dx   #b0000000100000000)
(define s    #b0000000000000000)
(define bh   #b0000000000000000)

