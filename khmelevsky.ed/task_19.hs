-- Задание:
--  Задан список элементами которого являются списки чисел. 
--  Сформировать список, содержащий максимальные элементы каждого из подсписков. 
--  Найти максимальный элемент из этих максимальных.

main :: IO ()
main = do
    print "List of max numbers:"
    let listMaxNumbers = maxNumbers numbers
    print listMaxNumbers

    print "Maximum number:"
    print $ maxNumber listMaxNumbers
    where
        numbers :: [[Integer]]
        numbers = [
                [0, 1, 4, 10],
                [2, 14, 42, 10],
                [20, 14, 2, 0]
            ]

-- Проходимся по кортежам списка, вычисляем стоимость каждого товара и суммируем полученный список
maxNumbers :: [[Integer]] -> [Integer]
maxNumbers = map maxNumber

-- Вычисляем стоимость товара в зависимости от его количества
maxNumber :: Ord a => [a] -> a
maxNumber arr = head $ filter (\x -> x==maximum arr) arr