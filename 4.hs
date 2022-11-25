data Tovar = Tovar String Integer Integer deriving (Show)
price :: [Tovar] -> Integer

price [] = 0
price (x:xs) = oneTovarCount x * oneTovarValue x + price xs
                where oneTovarCount (Tovar name count value) = count
                      oneTovarValue (Tovar name count value) = value

