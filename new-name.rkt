;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname new-name) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (new-name name)
  (cond [(> (string-length name) 9)
         (cond [(string<? name "M")
                (string-append (substring name 0 5)
                               (substring name
                                          (- (string-length name) 4)
                                          (string-length name)))]
               [else
                (string-append (substring name
                                          (- (string-length name) 4)
                                          (string-length name))
                               (substring name 0 5))])]
        [(> (string-length name) 5)
         (string-append "COLUM" (substring name
                                           (- (string-length name) 3)
                                           (string-length name)))]
        [else (substring name 1 (string-length name))]))
                                          
         