-- Задание:
-- Задан текст. Текст содержит предложения. Признаком конца предложения является точка. Построить список предложений.

splitText :: String -> [String]
splitText [] = []
splitText text = (takeWhile (/= '.') text) : splitText (dropWhile (== ' ') (dropWhile (/= '.') text))
