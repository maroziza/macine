(define font
  '((24 36 66 66 66 66 66 66 36 24) ; char_0
     (8 24 40 8 8 8 8 8 8 62) ; char_1
     (60 66 66 2 12 16 32 64 64 126) ; char_2
     (60 66 66 2 28 2 2 66 66 60) ; char_3
     (4 12 20 36 68 68 126 4 4 4) ; char_4
     (126 64 64 64 124 2 2 2 66 60) ; char_5
     (28 32 64 64 124 66 66 66 66 60) ; char_6
     (126 2 2 4 4 4 8 8 8 8) ; char_7
     (60 66 66 66 60 66 66 66 66 60) ; char_8
     (60 66 66 66 62 2 2 2 4 56) ; char_9
     (24 36 36 66 66 126 66 66 66 66) ; char_A
     (64 64 92 98 66 66 66 66 98 92) ; char_b
     (0 0 60 66 64 64 64 64 66 60) ; char_c
     (2 2 58 70 66 66 66 66 70 58) ; char_d
     (126 64 64 64 124 64 64 64 64 126) ; char_E
     (12 16 16 16 124 16 16 16 16 16))) ; char_f


(define do-screen
  (asm
    ; bh= page to display
    ! al= 0 ; line pointer
    ! bl= 0 ; data pointer, limited for first 256 bytes for now

    ))

(define do-line
  (asm
    ; todo draw line number
    ! dx= 0 #x0f ; mask first char
    ! s= dx [ bh bl ] ;
    ! chcl= s
    ))

(define (jump-to-pixline CHAR)
  (asm ! ch= al CHAR))

(define (first-nibble FONT)
  (asm
    ! out= FONT
    ! dx= 0 #xf0
    ! ch= dx [bh bl]
    ))

(define (second-nibble FONT)
  (asm
    ! out= FONT
    ! dx= 0 #x0f
    ! bl= bl 1
    ! s= dx [ bh bl ]
    ! chcl= s
    ))

(define (font-to-char)
(define (produce-verses font row result)
  (if (nil? font)
    result
    (produce-verses (cdr font) (+ 1 row)
      (cons (font-to-char (car font) row) result)))
  )