;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname count-crate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct juicecrate (apple orange lemon))
(define-struct sodacrate (rootbeer gingerale vanillacola))
(define-struct teacrate (green black herbal bubble))

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

       
                    