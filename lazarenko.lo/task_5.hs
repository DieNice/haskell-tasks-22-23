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
getCost (_, amount, price) | amount < 1 = error "Amount of some element < 1"
                           | price < 0 = error "Price of some element < 0"
                           | otherwise = fromInteger amount * price

main = do
    print (getMaxProfit [("first", 2, 200), ("second", 9, 190.5), ("third", 1, 400)])
