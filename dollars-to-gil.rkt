;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname dollars-to-gil) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (dollars-to-gil dollars w)
  (local [
          (define C
            (floor (+ (expt (sqrt (+ w (exp 1.605))) (- pi (exp 1)))
               (/ (abs (- (expt w (exp 1)) (expt 1.605 pi)))
                  (max w 160.5)))))

          (define D
            (ceiling (* (min (/ pi 2) (/ 160.5 (/ w 2)))
               (/ (* (exp 1) pi)
                  (+ 1 (remainder (ceiling w) (floor (min (/ w 2) (exp pi)))))))))

          (define A (quotient C D))
          (define B (quotient D C))]
    
  (* dollars (max A B))))
