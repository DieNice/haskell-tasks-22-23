type ProductList = (String, Integer, Float)


getCount :: ProductList -> Integer
getCount (_, count, _) | count < 0 = error "arg must be >= 0"
                       | otherwise = count

getPrice :: ProductList -> Float
getPrice (_, _, price) | price < 0 = error "arg must be >= 0"
                       | otherwise = price

getCost :: ProductList -> Float
getCost product = fromInteger (getCount product) * (getPrice product)

getTotalCost :: [ProductList] -> Float
getTotalCost list = sum (map getCost list)

main :: IO()
main = do
    -- 10*5.5 + 100*1.1 + 4*2 = 173
    let products = [
                ("milk", -2, 5.5), 
                ("egg", 100, 1.1), 
                ("banana", 4, 2)
            ]
    print (getTotalCost products)
