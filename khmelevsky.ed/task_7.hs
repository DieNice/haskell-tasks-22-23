-- Задание:
--  Задан текст. 
--  Текст содержит предложения. 
--  Признаком конца предложения является точка. Построить список предложений.

main :: IO()
main = do
    print $ wordsWhen (=='.') str
    where
        str = "Hello, my name Egor. I'm study at FEFU."

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'