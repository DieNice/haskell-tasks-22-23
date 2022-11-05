-- Информация о товарах представлена списком следующей
-- структуры: название, кол-во, стоимость единицы.
-- Написать функцию, которая вычисляет стоимость всех товаров.

type Good = (String, Integer, Double) 

getSum :: [Good] -> Double
getSum goods = helper goods 0

getCost :: Good -> Double
getCost (name, amount, price) = fromInteger amount * price

helper :: [Good] -> Double -> Double
helper []    cost = cost
helper goods cost = helper (tail goods) (getCost (head goods) + cost)

main = do
    print (getSum [])
    print (getSum [("name1", 4, 100), ("name2", 9, 230.1), ("name3", 1, 900)])