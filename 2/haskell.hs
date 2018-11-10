fibs = 0 : 1 : [ a+b | (a,b) <- zip fibs (tail fibs) ]
main = print (sum (filter even (takeWhile (<4000000) fibs)))

