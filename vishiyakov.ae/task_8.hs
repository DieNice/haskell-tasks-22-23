
-- TASK 8

--Отсортировать список чисел в порядке убывания.


quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (> p) xs
        greater = filter (<= p) xs


main = do
    print $ quicksort [1, 5, 7, 10]
    print $ quicksort [10, 7, 5, 1]
    print $ quicksort [1, 10, 7, 5]
    print $ quicksort [1, 3]
