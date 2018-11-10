(define multiples-aux
  X MAX CUR -> [CUR | (multiples-aux X MAX (+ CUR X))] where (<= CUR MAX)
  X MAX CUR -> [])

(define multiples
  X MAX -> (multiples-aux X MAX X))

(define merge
  [E1 | R1] L2        -> [E1 | (merge R1 L2)] where (< E1 (head L2))
  [E1 | R1] [E2 | R2] -> [E1 | (merge R1 R2)] where (= E1 E2)
  L1        [E2 | R2] -> [E2 | (merge L1 R2)]
  _         _         -> [])

(define euler-1
 MAX -> (merge (multiples 3 MAX) (multiples 5 MAX)))
