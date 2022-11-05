-- Информация о товарах представлена списком следующей
-- структуры: название, кол-во, стоимость единицы.
-- Написать функцию, которая определяет от продажи каких
-- товаров можно получить наибольшую сумму.

type Good = (String, Integer, Double) 

getMaxProfit  :: [Good] -> String
getMaxProfit goods | not (null goods) =
                        let helper :: [Good] -> String -> Double -> String
                            helper []    name profit = name
                            helper goods name profit =
                                if currentProfit > profit then
                                    helper (tail goods) (getName (head goods)) currentProfit
                                else
                                    helper (tail goods) name profit
                                where
                                    currentProfit = getCost (head goods)
                        in helper goods (getName (head goods)) (getCost (head goods))
                   | otherwise = error "There are no goods!"

getName :: Good -> String
getName (name, _, _) = name

getCost :: Good -> Double
getCost (_, amount, price) = fromInteger amount * price

main = do
    print (getMaxProfit [("name1", 4, 100), ("name2", 9, 230.1), ("name3", 2, 900)])
