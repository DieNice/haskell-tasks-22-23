data Tovar = Tovar String Integer Integer deriving (Show)
maxprice :: [Tovar] -> Integer

maxprice [] = 0
maxprice (x:xs) = max (oneTovarCount x * oneTovarValue x) (maxprice xs)
                where oneTovarCount (Tovar name count value) = count
                      oneTovarValue (Tovar name count value) = value