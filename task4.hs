-- Информация о товарах представлена списком следующей структуры: 
--  + название; 
--  + кол-во;
--  + стоимость единицы. 
-- Написать функцию, которая вычисляет стоимость всех товаров.

type Car = (String, Integer, Integer)

getCount :: Car -> Integer
getCount (_, count, _) | count < 0 = error "arg must be >= 0"
                       | otherwise = count
                       
                       
getPrice :: Car -> Integer
getPrice (_, _, price) | price < 0 = error "arg must be >= 0"
                       | otherwise = price

getSum :: [Car] -> Integer
getSum cars = helper cars 0

getCost :: Car -> Integer
getCost (name, amount, price) = fromInteger amount * price

helper :: [Car] -> Integer -> Integer
helper [] cost = cost
helper cars cost = helper (tail cars) (getCost (head cars) + cost)

main = do
    print (getSum[("corolla", 3, 250), ("camry", 3, 318), ("crown", 19, 63)])
   