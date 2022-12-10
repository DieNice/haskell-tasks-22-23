-- Задание:
--  Задан текст состоящий из символов. 
--  Текст содержит слова. 
--  Признаком конца слова является пробел. Построить список слов.

main :: IO()
main = do
    print $ wordsWhen str ' '
    print $ wordsWhen str1 ' '
    print $ wordsWhen str2 ' '
    print $ wordsWhen str3 ' '
    where
        str = "gg wp"
        str1 = ""
        str2 = " "
        str3 = "gg wp. Aboba abobovna"

wordsWhen :: String -> Char -> [String]
wordsWhen text separator = let
                    insert :: (Ord a) => [a] -> a -> [a]
                    insert a b = a ++ [b]

                    helper :: [String] -> String -> String -> [String]
                    helper words word text | word == "" && text == "" = words
                                           | text == "" = insert words word
                                           | head text == separator = helper (helper words word "") "" $ tail text
                                           | otherwise = helper words (insert word $ head text) $ tail text
                in helper [] "" text