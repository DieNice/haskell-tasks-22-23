sortWords :: [String] -> [String]
sortWords [] = []
sortWords (p:xs) = sortWords xs1  ++  [p]  ++  sortWords xs2
                   where     xs1 = [x | x <- xs, x <= p] 
                             xs2 = [x | x <- xs, x > p]
