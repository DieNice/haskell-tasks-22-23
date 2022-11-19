
-- TASK 10

-- Задан список студентов.
-- Элемент списка содержит фамилию студента и средний балл, полученный после сдачи экзаментов.

-- Отсортировать по убыванию среднего балла.


meanScore :: (a, b) -> b
meanScore (_, mean) = mean

quicksort :: Ord a => [(s, a)] -> [(s, a)]
quicksort [] = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (\q -> meanScore(p) <  meanScore(q)) xs
        greater = filter (\q -> meanScore(p) >= meanScore(q)) xs

main :: IO ()
main = do
    print $ quicksort students
    where
        students :: [(String,Float)]
        students = [
                ("A", 4.4),
                ("B", 4.5),
                ("C", 3.1),
                ("D", 2.9),
                ("E", 5.0),
                ("F", 1.0)
            ]
