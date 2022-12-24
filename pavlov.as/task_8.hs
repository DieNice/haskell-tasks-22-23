-- Задание:
-- Отсортировать список чисел в порядке убывания.

sort :: [Int] -> [Int]
sort [] = []
sort (x:xs) = sort [y | y <- xs, y > x] ++ [x] ++ sort [y | y <- xs, y <= x]
