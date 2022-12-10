-- Задание:
--  Отсортировать список чисел в порядке убывания.

main :: IO()
main = do
    print $ qsort nums
    where
        nums = [1, 5, 7, 2, 4]

-- Реализация быстрой сортировки
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort (filter (> x) xs) ++ [x] ++ qsort (filter (<= x) xs)