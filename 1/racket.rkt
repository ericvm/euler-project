#lang racket
(require racket/stream)

(define (multiples number)
  (for/stream ([k (in-naturals)])
              (* (+ k 1) number)))

(define (interleave s1 s2)
  (let ([x (stream-ref s1 0)]
        [y (stream-ref s2 0)])
    (cond [(< x y) (stream-cons x (interleave (stream-rest s1) s2))]
          [(= x y) (stream-cons x (interleave (stream-rest s1) (stream-rest s2)))]
          [else    (stream-cons y (interleave s1 (stream-rest s2)))])))

(sequence->list
 (stop-before (interleave (multiples 3) (multiples 5))
              (lambda x (>= (car x) 1000))))
