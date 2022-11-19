sort :: [String] -> [String]
sort [] = []
sort (h:t) = sort [x | x <- t, x < h] ++ [h] ++ sort [x | x <- t, x >= h]

main = do
    print (sort [])
    print (sort ["bar"])
    print (sort ["tea", "cofee", "milk", "art", "Card", "Banana"])