
-- TASK 6

-- Задан текст состоящий из символов. Текст содержит слова.
-- Признаком конца слова является пробел.
--
-- Построить список слов.


text2words :: String -> [String]
text2words text = let helpFunc :: [String] -> String -> String -> [String]
                      helpFunc words word "" | word == "" = words
                                             | otherwise = words ++ [word]

                      helpFunc words word text | head text == ' ' = helpFunc (helpFunc words word "") "" (tail text)
                                               | otherwise = helpFunc words (word ++ [head text]) (tail text)

                  in helpFunc [] "" text


main :: IO ()
main = do
          print $ text2words "hello"
          print $ text2words "hello world !"
          print $ text2words " hello world !"
          print $ text2words "hello world ! "


