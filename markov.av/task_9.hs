-- Задан список латинских слов. Упорядочить по алфавиту.

sort :: [String] -> [String]
sort [] = []
sort (h:t) = sort [x | x <- t, x < h] ++ [h] ++ sort [x | x <- t, x >= h]

main = do
    print (sort [])
    print (sort ["sea"])
    print (sort ["teapot", "Zoo", "table", "art", "Car", "Banana"])