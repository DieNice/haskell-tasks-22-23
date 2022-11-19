type Product = (String, Integer, Integer)

getSum :: [Product] -> Integer
getSum products = helper products 0

getCost :: Product -> Integer
getCost (name, amount, price) = fromInteger amount * price

helper :: [Product] -> Integer -> Integer
helper [] cost = cost
helper products cost = helper (tail products) (getCost (head products) + cost)

main = do
    print (getSum[("first", 5, 500), ("second", 3, 318), ("third", 19, 63)])
    print (getSum[])