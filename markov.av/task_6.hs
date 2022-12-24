-- Задан текст состоящий из символов. Текст содержит слова.
-- Признаком конца слова является пробел. Построить список слов.

getWords :: String -> [String]
getWords text = let helper :: [String] -> String -> String -> [String]
                    helper words word ""   = if word == "" then words else words ++ [word]
                    helper words word text | head text == ' ' = helper (helper words word "") "" (tail text)
                                           | otherwise        = helper words (word ++ [head text]) (tail text)
                in helper [] "" text

main = do
    print (getWords "")
    print (getWords "  ")
    print (getWords "apple cup letter window")
    print (getWords " apple cup  letter window   ")