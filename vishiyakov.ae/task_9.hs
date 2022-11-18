
-- TASK 9

--Задан список латинских слов. Упорядочить по алфавиту.


quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

main = do
    print $ quicksort ["D", "C", "B", "A"]
    print $ quicksort ["hello", "my", "dear", "friend"]