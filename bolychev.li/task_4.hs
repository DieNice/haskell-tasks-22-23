data Tovar = Tovar String Integer Integer deriving (Show)
price :: [Tovar] -> Integer

price [] = 0
price (x:xs) | (oneTovarCount x >=  0) && (oneTovarValue x >=  0) = oneTovarCount x * oneTovarValue x + price xs
             | oneTovarValue x <  0 = error "ERROR! Value < 0"
             | oneTovarCount x <  0 = error "ERROR! Count < 0"
                where oneTovarCount (Tovar name count value) = count
                      oneTovarValue (Tovar name count value) = value

