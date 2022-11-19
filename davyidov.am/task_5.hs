type Product = (String, Integer, Double)

getMaxProfit :: [Product] -> String
getMaxProfit products
  | not (null products) =
      let helper :: [Product] -> String -> Double -> String
          helper [] name profit = name
          helper products name profit =
            if currentProfit > profit
              then helper (tail products) (getName (head products)) currentProfit
              else helper (tail products) name profit
            where
              currentProfit = getCost (head products)
       in helper products (getName (head products)) (getCost (head products))
  | otherwise = error "There are no products!"

getName :: Product -> String
getName (name, _, _) = name

getCost :: Product -> Double
getCost (_, amount, price) = fromInteger amount * price

main = do
  print (getMaxProfit [("name1", 4, 100), ("name2", 9, 230.1), ("name3", 2, 900)])