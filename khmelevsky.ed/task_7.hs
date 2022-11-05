-- Задание:
--  Задан текст. 
--  Текст содержит предложения. 
--  Признаком конца предложения является точка. Построить список предложений.

main :: IO()
main = do
    print $ wordsWhen str '.'
    where
        str = "Hello, my name Egor. I'm study at FEFU."

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