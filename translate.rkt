;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname translate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (my-sort lon)
  (cond [(empty? lon) empty]
        [else (insert (first lon) (my-sort (rest lon)))]))

(define (insert num slon)
  (cond [(empty? slon) (cons num slon)]
        [(<= num (first slon)) (cons num slon)]
        [else (cons (first slon) (insert num (rest slon)))]))



;; A Dictionary is a listof Translation
(define-struct translation (key val))

(define dict1 (list (make-translation #\A (list #\B #\D))
                    (make-translation #\C (list #\O #\M))
                    (make-translation #\E (list #\L #\D))
                    (make-translation #\G (list #\T #\K))
                    (make-translation #\H (list #\O #\O #\G))
                    (make-translation #\I (list #\M #\O))
                    (make-translation #\J (list #\G #\N #\U))
                    (make-translation #\L (list #\W #\O))
                    (make-translation #\R (list #\R #\R #\O))
                    (make-translation #\X (list #\A #\V #\I #\E #\R))
                    (make-translation #\Y (list #\C #\U))))

(define (translate word dict)
  (local [(define word/lst (string->list word))

          (define (reverse-lst lst)
            (foldl (lambda (x y) (cons x y)) empty lst))

          (define (get-translation char dict)
            (cond [(empty? dict) empty]
                  [(char=? char (translation-key (first dict)))
                   (reverse-lst (translation-val (first dict)))]
                  [else (get-translation char (rest dict))]))

          (define (process-list chars)
            (cond [(empty? chars) empty]
                  [else (append (get-translation (first chars) dict1)
                              (process-list (rest chars)))]))]
    
    (list->string (process-list word/lst))))