type Name = String
type Count = Integer
type Price = Float
type Cost = Float
type Product = (Name, Count, Price)
type ProductList = [Product]


getCount :: Product -> Count
getCount (_, count, _) | count < 0 = error "arg must be >= 0"
                       | otherwise = count

getPrice :: Product -> Price
getPrice (_, _, price) | price < 0 = error "arg must be >= 0"
                       | otherwise = price

getCost :: Product -> Cost
getCost product = fromInteger (getCount product) * (getPrice product)

getTotalCost :: ProductList -> Cost
getTotalCost list = sum (map getCost list)

getMaxProfit :: ProductList -> Product
getMaxProfit list = helper (tail list) (head list)

helper :: ProductList -> Product -> Product
helper [] product = product
helper list product = 
    if currentCost > cost
        then helper (tail list) (head list)
        else helper (tail list) product
    where
        currentCost = getCost (head list)
        cost = getCost product

main :: IO()
main = do
    -- 10*5.5 + 100*1.1 + 4*2 = 173
    let products = [
                ("milk", 10, 11.5), 
                ("egg", 100, 1.1), 
                ("banana", 4, 2)
            ]
    print (getMaxProfit products)
