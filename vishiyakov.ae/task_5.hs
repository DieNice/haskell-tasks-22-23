
-- TASK 5 !!! правка для отрицательных

-- Информация о товарах представлена списком следующей структуры:
-- название,
-- кол-во,
-- стоимость единицы.
--
-- Написать функцию, которая оповещает от продажи каких товаров можно получить большую сумму.


type Product = (String, Integer, Double)

main :: IO ()
main = print $ getMaxCountPrice products
       where
       products = [
                    ("prod 1", 1, 10),
                    ("prod 2", 2, 10),
                    ("prod 3", 3, 10),
                    ("prod 4", 5, 10),
                    ("prod 5", 5, 10),
                    ("prod 6", 3, 10)
                  ]


getPriceCount :: Product -> Double
getPriceCount (_, count, price) | count >= 0 && price >= 0  = price  * (fromIntegral count)
                                | otherwise = error "count < 0 || price < 0"

getMaxCountPrice :: [Product] -> [Product]
getMaxCountPrice prods = getMaxCountPriceH prods [("Нет товаров",0,0)]

getMaxCountPriceH :: [Product] -> [Product] -> [Product]
getMaxCountPriceH [] prodMax = prodMax
getMaxCountPriceH prods prodMax | getPriceCount(head prodMax ) == getPriceCount( head prods )
                                = getMaxCountPriceH (tail prods) (prodMax ++ [head prods])

                                | getPriceCount(head prodMax ) > getPriceCount( head prods )
                                = getMaxCountPriceH (tail prods) (prodMax)

                                | getPriceCount(head prodMax ) < getPriceCount( head prods )
                                = getMaxCountPriceH (tail prods) [head prods]

allProductPriceH :: Double -> [Product] -> Double
allProductPriceH s [] = s
allProductPriceH s prods = allProductPriceH (s + getPriceCount(head prods)) (tail prods)

allProductPrice :: [Product] -> Double
allProductPrice prods = allProductPriceH 0 prods
