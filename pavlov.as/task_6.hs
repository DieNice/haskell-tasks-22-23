-- Задание:
-- Задан текст состоящий из символов. Текст содержит слова. Признаком конца слова является пробел. Построить список слов.


splitWords :: String -> [String]
splitWords [] = []
splitWords text = (takeWhile (/= ' ') text) : splitWords (dropWhile (== ' ') (dropWhile (/= ' ') text))


--takeWhile :: (a -> Bool) -> [a] -> [a]
--takeWhile _ [] = []
--takeWhile p (x:xs)
--    | p x = x : takeWhile p xs
--    | otherwise = []
--
--dropWhile :: (a -> Bool) -> [a] -> [a]
--dropWhile _ [] = []
--dropWhile p (x:xs)
--    | p x = dropWhile p xs
--    | otherwise = x:xs