-- ==Задание==
-- Информация о товарах представлена списком следующей структуры: 
--  + название; 
--  + кол-во;
--  + стоимость единицы. 
-- Написать функцию, которая вычисляет стоимость всех товаров.

main :: IO()
main = do
    print $ resultCost products
    where
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
resultCost :: [ProductList] -> Float
resultCost x = sum (map finalProductCost x)

-- Вычисляем стоимость товара в зависимости от его количества
finalProductCost :: ProductList -> Float
finalProductCost x = productCost x * fromInteger (productCount x)