--Intercala duas listas ordenadas, gerando uma lista ordenada, exluindo elementos repetidos
intercala :: Ord a => [a]->[a]->[a]
intercala l1 l2
	| elem1 < elem2 = elem1 : intercala (tail l1) l2
	| elem1 == elem2 = elem1 : intercala (tail l1) (tail l2)
	| otherwise = elem2 : intercala l1 (tail l2)
	where elem1 = head l1
	      elem2 = head l2

ans = intercala [3,6..] [5,10..]

main = do
	print (takeWhile (<1000) ans)
