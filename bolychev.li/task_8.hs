sort :: [Int] -> [Int]
sort [] = []
sort (p:xs) =     sort xs1  ++  [p]  ++  sort xs2
                where  xs1 = [x | x <- xs, x > p] 
                       xs2 = [x | x <- xs, x <= p]
