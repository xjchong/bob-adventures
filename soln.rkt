(module soln (lib "plt-pretty-big-text.ss" "lang")
  
  ;; (solutions fn-name fn) consumes a function name and related function,
  ;;    and puts the function through a series of tests.
  ;; solution: (Any... -> Any...) -> (anyof Any Bool Error)

  (define (solutions fn-name fn)
    (cond [(string=? fn-name "dollars-to-gil") (test-dollars-to-gil fn)]
          [(string=? fn-name "travel-plans")   (test-travel-plans fn)]
          [(string=? fn-name "new-name")       (test-new-name fn)]
          [(string=? fn-name "count-crate")    (test-count-crate fn)]))

  (define (print-score fn-name test-list)
    (fprintf (current-output-port)
             "(~a) score: ~a/~a ~n"
             fn-name
             (length (filter (lambda (x) x) test-list))
             (length test-list)))

  (define (test-dollars-to-gil dollars-to-gil)
    (local [(define test-list
              (list (equal? (dollars-to-gil 0 20) 0)
                    (equal? (dollars-to-gil 0 160) 0)
                    (equal? (dollars-to-gil 0 160.5) 0)
                    (equal? (dollars-to-gil 0 161) 0)
                    (equal? (dollars-to-gil 1 20) 1)
                    (equal? (dollars-to-gil 1 160) 6111)
                    (equal? (dollars-to-gil 1 160.5) 440)
                    (equal? (dollars-to-gil 1 161) 442)
                    (equal? (dollars-to-gil 100 20) 100)
                    (equal? (dollars-to-gil 100 160) 611100)
                    (equal? (dollars-to-gil 100 160.5) 44000)
                    (equal? (dollars-to-gil 100 161) 44200)
                    (equal? (dollars-to-gil 100.5 20) 100.5)
                    (equal? (dollars-to-gil 100.5 160) 614155.5)
                    (equal? (dollars-to-gil 100.5 160.5) 44220)
                    (equal? (dollars-to-gil 100.5 161) 44421)))]
      (print-score "dollars-to-gil" test-list)))

  (define (test-travel-plans travel-plans)
    (local [(define test-list 
              (list (equal? (travel-plans true true true true) 'sleep)
                    (equal? (travel-plans true true true false) 'plains)
                    (equal? (travel-plans true true false true) 'swamp)
                    (equal? (travel-plans true true false false) 'swamp)
                    (equal? (travel-plans true false true true) 'sleep)
                    (equal? (travel-plans true false true false) 'plains)
                    (equal? (travel-plans true false false true) 'forest)
                    (equal? (travel-plans true false false false) 'plains)
                    (equal? (travel-plans false true true true) 'sleep)
                    (equal? (travel-plans false true true false) 'forest)
                    (equal? (travel-plans false true false true) 'swamp)
                    (equal? (travel-plans false true false false) 'swamp)
                    (equal? (travel-plans false false true true) 'sleep)
                    (equal? (travel-plans false false true false) 'forest)
                    (equal? (travel-plans false false false true) 'forest)
                    (equal? (travel-plans false false false false) 'forest)))]
      (print-score "travel-plans" test-list)))

  (define (test-new-name new-name)
    (local [(define test-list
              (list (equal? (new-name "HERB") "ERB")
                    (equal? (new-name "MOUNTAINWEST") "WESTMOUNT")
                    (equal? (new-name "VICTORBIA") "COLUMBIA")
                    (equal? (new-name "BEECHDENLAWN") "BEECHLAWN")))]
      (print-score "new-name" test-list)))
  
  (define-struct juicecrate (apple orange lemon))
  (define-struct sodacrate (rootbeer gingerale vanillacola))
  (define-struct teacrate (green black herbal bubble))
  
  (define (test-count-crate count-crate)
    (local [

            (define jcrate1 (make-juicecrate 0 0 0))
            (define jcrate2 (make-juicecrate 5 0 0))
            (define jcrate3 (make-juicecrate 0 6 0))
            (define jcrate4 (make-juicecrate 0 0 7))
            (define jcrate5 (make-juicecrate 5 6 8))
            (define scrate1 (make-sodacrate 0 0 0))
            (define scrate2 (make-sodacrate 5 0 0))
            (define scrate3 (make-sodacrate 0 6 0))
            (define scrate4 (make-sodacrate 0 0 7))
            (define scrate5 (make-sodacrate 5 6 8))
            (define tcrate1 (make-teacrate 0 0 0 0))
            (define tcrate2 (make-teacrate 5 0 0 0))
            (define tcrate3 (make-teacrate 0 6 0 0))
            (define tcrate4 (make-teacrate 0 0 7 0))
            (define tcrate5 (make-teacrate 0 0 0 8))
            (define tcrate6 (make-teacrate 5 6 7 8))

            (define test-list
              (list (equal? (count-crate jcrate1) 0)
                    (equal? (count-crate jcrate2) 6)
                    (equal? (count-crate jcrate3) 6)
                    (equal? (count-crate jcrate4) 8)
                    (equal? (count-crate jcrate5) 20)
                    (equal? (count-crate scrate1) 0)
                    (equal? (count-crate scrate2) 6)
                    (equal? (count-crate scrate3) 6)
                    (equal? (count-crate scrate4) 8)
                    (equal? (count-crate scrate5) 20)
                    (equal? (count-crate tcrate1) 0)
                    (equal? (count-crate tcrate2) 6)
                    (equal? (count-crate tcrate3) 6)
                    (equal? (count-crate tcrate4) 8)
                    (equal? (count-crate tcrate5) 8)
                    (equal? (count-crate tcrate6) 26)))]
      (print-score "count-crate" test-list)))
                    

  (provide
   solutions))