sumncount :: Integer -> (Integer, Integer)
sumncount x = (f1, f2)
	where 
		f1 = f1x x 0
		f2 = f2x x 0
		f1x 0 acc = acc
		f1x x acc = f1x (x `div` 10) (acc + 1) 
		f2x 0 acc = acc
		f2x x acc = f2x (x `div` 10) (acc + (x `mod` 10))