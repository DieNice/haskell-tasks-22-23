sort :: [String] -> [String]
sort [] = []
sort (h:t) = sort [x | x <- t, x < h] ++ [h] ++ sort [x | x <- t, x >= h]

main = do
    print (sort ["BB", "Bb", "bB", "bb", "AA", "Aa", "aA", "aa", "AAA"])