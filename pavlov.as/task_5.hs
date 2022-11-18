-- Задание:
-- Информация о товарах представлена списком следующей структуры: название, кол-во, стоимость единицы. Написать функцию,
-- которая определяет от продажи каких товаров можно получить большую сумму.

data Product = Product String Int Double deriving (Show)

products = [Product "Milk" 2 50.0, Product "Bread" 1 30.0, Product "Eggs" 10 10.0]

-- Функция, которая возвращает сумму продажи товара
getSum :: Product -> Double
getSum (Product _ count price) = fromIntegral count * price

-- Функция, которая возвращает список сумм продажи товаров
getSums :: [Product] -> [Double]
getSums [] = []
getSums (x:xs) = getSum x : getSums xs

-- Функция, которая возвращает максимальное значение из списка
getMax :: [Double] -> Double
getMax [] = 0
getMax (x:xs) = max x (getMax xs)

-- Функция, которая возвращает список товаров, продажа которых принесла максимальную сумму
getMaxProducts :: [Product] -> [Product]
getMaxProducts [] = []
getMaxProducts n = getMaxProducts' n (getMax (getSums n))
    where
        getMaxProducts' [] _ = []
        getMaxProducts' (x:xs) maxSum = if getSum x == maxSum then x : getMaxProducts' xs maxSum else getMaxProducts' xs maxSum

-- Функция, которая возвращает список названий товаров
getProductsNames :: [Product] -> [String]
getProductsNames [] = []
getProductsNames (x:xs) = name x : getProductsNames xs
    where name (Product n _ _) = n

-- Функция, которая возвращает список названий товаров, продажа которых принесла максимальную сумму
getMaxProductsNames :: [Product] -> [String]
getMaxProductsNames = getProductsNames . getMaxProducts
