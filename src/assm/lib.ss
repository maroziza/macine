(define ! '!)       

(define (lasm . z)  ((lambda (x) (cons x (cons x '())))(apply asm z)))

;; list utils
(define (split! . z)
  (cond
   ((null? z) '(()))
   ((eq? '! (car z)) (cons '() (apply split! (cdr z))))
   (#t ((lambda (x) (cons (cons (car z) (car x)) (cdr x)))
	(apply split! (cdr z))))))

(define (rotate s)
  (if (null? (car s))
      '()
      (cons (map car s) (rotate (map cdr s)))))

(define (hexout offset step list)
  ;; todo split if data more than 256b, or even 16b
  (map (lambda (x y) (string-append
		      ":"
		      (hex-byte (/ (string-length y) 2)) ; data-length
		      x			; address
		      "00" ; record type: 00 -data
		      y			; data
		      "FF" ; checksum
		      "\n"
		      ))
       (map hex (range offset (+ offset (* step (length list))) step))
       (map (lambda (x) (apply string-append x)) list)))



;; number utils
(define (byte i) (bitwise-and #xFF i))

;; string utils


(define (slist->string slst)
  (string-join (map
		(lambda (in) (if (number? in) (number->string in) (
		symbol->string in))) slst) " "))

(define (pad c x . n)
  ((lambda (spaces)
     (if (or (null? n ) (< 0 (car n)))
	 (string-append x spaces)
	 (string-append spaces x)))
   (make-string (max 0 (- (if (null? n) 20 (abs (car n)))
 (string-length x))) c )))

(define (hex c) (string-upcase (pad #\0 (number->string c 16) -4)))
(define (hex-byte c) (string-upcase (pad #\0 (number->string c 16) -2)))
