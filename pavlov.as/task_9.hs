-- Задание:
-- Задан список латинских слов. Упорядочить по алфавиту.

sortWords :: [String] -> [String]
sortWords [] = []
sortWords (x:xs) = sortWords [y | y <- xs, y < x] ++ [x] ++ sortWords [y | y <- xs, y >= x]
