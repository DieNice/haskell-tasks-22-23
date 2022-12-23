-- Задан текст. Текст содержит предложения.
-- Признаком конца предложения является точка.
-- Построить список предложений.

-- Задан текст состоящий из символов. Текст содержит слова.
-- Признаком конца слова является пробел. Построить список слов.

getSentences :: String -> [String]
getSentences text = let helper :: [String] -> String -> String -> [String]
                        helper sentences sentence ""   = if sentence == "" then sentences else sentences ++ [sentence]
                        helper sentences sentence text | head text == ' ' = helper sentences (if sentence == "" then sentence else newSentence) (tail text)
                                                       | head text == '.' = helper (helper sentences newSentence "") "" (tail text)
                                                       | otherwise        = helper sentences newSentence (tail text)
                                                            where
                                                                newSentence = sentence ++ [head text]
                    in helper [] "" text

main = do
    print (getSentences "")
    print (getSentences "  ")
    print (getSentences "I love haskell. No. I hate it.")