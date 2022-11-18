-- Задание:
-- Информация о товарах представлена списком следующей структуры: название, кол-во, стоимость единицы. Написать функцию,
-- которая вычисляет стоимость всех товаров.

data Product = Product String Int Double deriving (Show)

products = [Product "Milk" 2 50.0, Product "Bread" 1 30.0, Product "Eggs" 10 10.0]

totalCost :: [Product] -> Double
totalCost [] = 0
totalCost (x:xs) = (cost x) + totalCost xs
    where cost (Product _ n p) = fromIntegral n * p
