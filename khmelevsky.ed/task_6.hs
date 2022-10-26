-- Задание:
--  Задан текст состоящий из символов. 
--  Текст содержит слова. 
--  Признаком конца слова является пробел. Построить список слов.

main :: IO()
main = do
    print $ wordsWhen (==' ') str
    where
        str = "gg wp"

-- Универсальная функция, в которую можно передать любой separator
wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'