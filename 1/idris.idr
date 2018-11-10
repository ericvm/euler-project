module Main

interleave : Ord a => List a -> List a -> List a
interleave (e1 :: r1) (e2 :: r2) with (compare e1 e2)
  | LT = e1 :: merge r1 (e2 :: r2)
  | EQ = e1 :: merge r1 r2
  | GT = e2 :: merge (e1 :: r1) r2

euler : Nat -> List Nat
euler = (interleave (take))

main : IO ()
main = putStrLn ?greeting
