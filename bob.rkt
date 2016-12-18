;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bob) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require "soln.rkt")

;;******************************************************************************

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

;;******************************************************************************

(define (travel-plans money? hungry? raining? weekend?)
  (cond [(and hungry? (not raining?)) 'swamp]
        [(and money? (not weekend?)) 'plains]
        [(not (and raining? weekend?)) 'forest]
        [else 'sleep]))

;;******************************************************************************

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

;;******************************************************************************

(define (count-crate crate)
  (local [(define (crate-sum-adjust sum)
            (cond [(even? sum) sum]
                  [else (add1 sum)]))]
    (cond [(juicecrate? crate)
           (crate-sum-adjust (+ (juicecrate-apple crate)
                                (juicecrate-orange crate)
                                (juicecrate-lemon crate)))]
          [(sodacrate? crate)
           (crate-sum-adjust (+ (sodacrate-rootbeer crate)
                                (sodacrate-gingerale crate)
                                (sodacrate-vanillacola crate)))]
          [else
           (crate-sum-adjust (+ (teacrate-green crate)
                                (teacrate-black crate)
                                (teacrate-herbal crate)
                                (teacrate-bubble crate)))])))

;;******************************************************************************


(define (test fn)
  (cond [(equal? fn travel-plans) (solutions "travel-plans" fn)]
        [(equal? fn dollars-to-gil) (solutions "dollars-to-gil" fn)]
        [(equal? fn new-name) (solutions "new-name" fn)]
        [(equal? fn count-crate) (solutions "count-crate" fn)]
        [else (error "No matching function found.")]))

