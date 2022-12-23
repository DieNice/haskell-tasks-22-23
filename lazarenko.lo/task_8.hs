-- Отсортировать список чисел в порядке убывания.

sort :: [Double] -> [Double]
sort [] = []
sort (h:t) = sort [x | x <- t, x > h] ++ [h] ++ sort [x | x <- t, x <= h]

main = do
    print (sort [1, 5, 7, 10])
    print (sort [10, 7, 5, 1])
    print (sort [1, 10, 7, 5])
    print (sort [])
    print (sort [1])