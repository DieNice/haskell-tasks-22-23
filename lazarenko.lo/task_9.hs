-- Задан список латинских слов. Упорядочить по алфавиту.

sort :: [String] -> [String]
sort [] = []
sort (h:t) = sort [x | x <- t, x < h] ++ [h] ++ sort [x | x <- t, x >= h]

main = do
    print (sort [])
    print (sort ["watermelon"])
    print (sort ["watermelon", "angry", "eat", "car", "cat", "apple"])