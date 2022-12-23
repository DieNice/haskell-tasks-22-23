-- Информация о товарах представлена списком следующей
-- структуры: название, кол-во, стоимость единицы.
-- Написать функцию, которая вычисляет стоимость всех товаров.

type Good = (String, Integer, Double) 

getSum :: [Good] -> Double
getSum goods = helper goods 0

getCost :: Good -> Double
getCost (_, amount, price) | amount < 1 = error "Amount of some element < 1"
                           | price < 0 = error "Price of some element < 0"
                           | otherwise = fromInteger amount * price

helper :: [Good] -> Double -> Double
helper []    cost = cost
helper goods cost = helper (tail goods) (getCost (head goods) + cost)

main = do
    print (getSum [])
    print (getSum [("first", 3, 50), ("second", 2, 80.5), ("third", 1, 900)])