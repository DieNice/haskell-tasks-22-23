
-- TASK 7

--Задан текст. Текст содержит предложения. Признаком конца предложения является точка.
--
-- Построить список предложений.

text2sentence  :: String -> [String]
text2sentence  text = let helpFunc :: [String] -> String -> String -> [String]
                          helpFunc words word "" | word == "" = words
                                                 | otherwise = words ++ [word]

                          helpFunc words word text | head text == '.' = helpFunc (helpFunc words word "") "" (tail text)
                                                   | otherwise = helpFunc words (word ++ [head text]) (tail text)

                      in helpFunc [] "" text


main :: IO ()
main = do
          print $ text2sentence "h.e. l.l o."
          print $ text2sentence "Here you can find activities to practise your reading skills. Reading will help you to improve your understanding of the language and build your vocabulary."
