type Product = (String, Integer, Integer)

getSum :: [Product] -> Integer
getSum products = helper products 0

getCost :: Product -> Integer
getCost (name, amount, price) | amount >= 0 && price >= 0  = price  * (fromInteger amount)
                              | otherwise = error "amount < 0 || price < 0"

helper :: [Product] -> Integer -> Integer
helper [] cost = cost
helper products cost = helper (tail products) (getCost (head products) + cost)

main = do
    print (getSum[("first", -5, 500), ("second", 3, 318), ("third", 19, 63)])
    print (getSum[])