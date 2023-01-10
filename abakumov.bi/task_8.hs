sort :: [Integer] -> [Integer]
sort [] = []
sort (h:t) = sort [x | x <- t, x > h] ++ [h] ++ sort [x | x <- t, x <= h]

main = do
    print (sort [1, 2, 3, 4])
    print (sort [4, 3, 2, 1])
    print (sort [1, 4, 3, 2])