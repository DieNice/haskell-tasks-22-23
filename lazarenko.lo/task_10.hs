-- Задание:
--  Задан список студентов. 
--  Элемент списка содержит фамилию студента и средний балл, 
--   полученный после сдачи экзаментов. 
--  Отсортировать по убыванию среднего балла.

main :: IO ()
main = do
    print $ qsort students
    where
        students :: [([Char],Float)]
        students = [
                ("Abakumov", 4.0),
                ("Khmelevsky", 4.33),
                ("Markov", 4.7),
                ("Kosicyna", 3.9)
            ]

second :: (a, b) -> b
second (_, x) = x

qsort :: Ord a1 => [(a2, a1)] -> [(a2, a1)]
qsort [] = []
qsort (x:xs) = qsort (filter (\y -> second x <= second y) xs) ++ [x] ++ qsort (filter (\y -> second x > second y) xs)