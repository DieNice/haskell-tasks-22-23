-- ==Задание==
-- Информация о товарах представлена списком следующей структуры: 
--  + название; 
--  + кол-во;
--  + стоимость единицы. 
-- Написать функцию, которая определяет от продажи каких товаров можно получить большую сумму.

-- Меня немного нервируют варнинги, поэтому добавил эту строчку, чтобы не отвлекали
-- P.S. Какая-то непонятная мне проблема с отступами в функции
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

main :: IO()
main = do
    print $ resultCost products
    where
        products::[(String, Integer, Float)]
        products = [
                ("name_1", 10, 100.99),
                ("name_2", 5, 110),
                ("name_3", 14, 75)
            ]

type Name = String
type Count = Integer
type Cost = Float
type ProductList = (Name, Count, Cost)

productName :: ProductList -> Name
productName (name, _, _) = name

productCount :: ProductList -> Count
productCount (_, count, _) = count

productCost :: ProductList -> Cost
productCost (_, _, cost) = cost

-- Проходимся по кортежам списка, вычисляем стоимость каждого товара и суммируем полученный список
-- resultCost :: [ProductList] -> Float
resultCost :: [ProductList] -> ProductList
resultCost x = lookupMy (map finalProductCost x) x

-- Смотрим какой товар является максимальным
lookupMy :: [Float] -> [ProductList] -> ProductList
lookupMy resultCostList (x:xs) | maximum resultCostList==finalProductCost x = x
                      | otherwise = lookupMy resultCostList xs

-- Вычисляем стоимость товара в зависимости от его количества
finalProductCost :: ProductList -> Float
finalProductCost x =  productCost x * fromInteger (productCount x)