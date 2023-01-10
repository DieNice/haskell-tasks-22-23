type Product = (String, Integer, Integer)

getMaxProfit  :: [Product] -> String
getMaxProfit products
    | not (null products) =
        let helper :: [Product] -> String -> Integer -> String
            helper [] name profit = name
            helper products name profit =
                if currentProfit > profit then helper (tail products) (getName (head products)) currentProfit
                else helper (tail products) name profit
                where
                    currentProfit = getCost (head products)
        in helper products (getName (head products)) (getCost (head products))
    | otherwise = error "Nothing"

getName :: Product -> String
getName (name, _, _) = name

getCost (name, amount, price) | amount >= 0 && price >= 0  = price  * (fromInteger amount)
                              | otherwise = error "amount < 0 || price < 0"

main = do
    print (getMaxProfit[("first", 5, 500), ("second", 3, 318), ("third", -19, 63)])
    print (getMaxProfit[("first", 5, 500)])
    -- print (getMaxProfit[])