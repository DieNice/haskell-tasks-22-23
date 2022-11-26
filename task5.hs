-- Задание:
-- Информация о товарах представлена списком следующей структуры: 
--  + название; 
--  + кол-во;
--  + стоимость единицы. 
-- Написать функцию, которая определяет от продажи каких товаров можно получить большую сумму.

type Car = (String, Integer, Integer)

getMaxProfit  :: [Car] -> String
getMaxProfit cars
    | not (null cars) =
        let helper :: [Car] -> String -> Integer -> String
            helper [] name profit = name
            helper cars name profit =
                if currentProfit > profit then helper (tail cars) (getName (head cars)) currentProfit
                else helper (tail cars) name profit
                where
                    currentProfit = getCost (head cars)
        in helper cars (getName (head cars)) (getCost (head cars))
    | otherwise = error "Nothing"

getName :: Car -> String
getName (name, _, _) = name

getCost :: Car -> Integer
getCost (_, amount, price) = fromInteger amount * price

main = do
    print (getMaxProfit[("corolla", 3, 250), ("camry", 3, 318), ("crown", 19, 63)])
    print (getMaxProfit[("corolla", 3, 250)])
    