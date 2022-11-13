
-- TASK 4

-- Информация о товарах представлена списком следующей структуры:
-- название,
-- кол-во,
-- стоимость единицы.
--
-- Написать функцию, которая вычисляет стоимость всех товаров.

type Product = (String, Integer, Double)

main :: IO ()
main = print $ allProductPrice products
       where
       products = [
                    ("1", 1, 10),
                    ("2", 2, 10),
                    ("3", 3, 10),
                    ("4", 4, 10),
                    ("5", 5, 10)
                  ]

--getCount :: Product -> Integer
--getCount (_, count, _) = count

--getPrice :: Product -> Double
--getPrice (_, _, price) = price

--getPriceCount :: Product -> Double
--getPriceCount p =  getPrice (p)  * fromIntegral (getCount (p))

getPriceCount :: Product -> Double
getPriceCount (_, count, price) =  price  * (fromIntegral count)

allProductPriceH :: Double -> [Product] -> Double
allProductPriceH s [] = s
allProductPriceH s prods = allProductPriceH (s + getPriceCount(head prods)) (tail prods)

--allProductPriceH s prods = allProductPriceH (fromIntegral (getCount (head prods)) * getPrice (head prods) + s) (tail prods)
-- почему-то, когда я пытался реализовать подобную строку меня слали превращать Int в Float
-- fromIntegral вообще никак не разрешал эту ситуацию
-- UPDATE: оказалось, что всё дело в том, что у меня стоял пробел перед объявлением функции

allProductPrice :: [Product] -> Double
allProductPrice prods = allProductPriceH 0 prods
