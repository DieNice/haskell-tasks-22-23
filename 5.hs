data Tovar = Tovar String Integer Integer deriving (Show)
maxprice :: [Tovar] -> Integer

maxprice [] = 0
maxprice (x:xs) | (oneTovarCount x >=  0) && (oneTovarValue x >=  0) = max (oneTovarCount x * oneTovarValue x) (maxprice xs)
             | oneTovarValue x <  0 = error "ERROR! Value < 0"
             | oneTovarCount x <  0 = error "ERROR! Count < 0"
                where oneTovarCount (Tovar name count value) = count
                      oneTovarValue (Tovar name count value) = value
