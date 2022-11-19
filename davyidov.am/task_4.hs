type Product = (String, Integer, Double)

getSum :: [Product] -> Double
getSum products = helper products 0

getCost :: Product -> Double
getCost (name, amount, price) = fromInteger amount * price

helper :: [Product] -> Double -> Double
helper [] cost = cost
helper products cost = helper (tail products) (getCost (head products) + cost)

main = do
  print (getSum [])
  print (getSum [("1", 4, 1010), ("2", 9, 230.99), ("3", 1, 900.3)])