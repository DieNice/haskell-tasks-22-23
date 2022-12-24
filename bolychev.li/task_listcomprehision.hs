lc :: [Integer] -> [Integer]
lc [] = []
lc xs = [if (x `mod` 2 == 0) then (x `div` 2) else (x * 2) | x <- xs]
