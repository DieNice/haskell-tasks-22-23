-- Задание:
--
-- Используя стандартное представление для списков, запрограммировать на Прологе следующие предикаты работы со списками.
-- Каждый предикат должен вычислять сложность (число шагов, необходимых для вычисления) для самого себя.
--  1.Вычисление разности соседних четных элементов списка
--  2.Проверка на принадлежность каждого элемента списка разностей исходному списку
--  3.Вычисление длины списка разностей
--  4.Вычисление минимальной разности
--  5.Вычисление произведений соседних элементов списка
--  6.Сортировка элементов списка произведений по убыванию
--  7.Сортировка элементов списка разностей по возрастанию

main :: IO ()
main = do
    putStrLn "1.Вычисление разности соседних четных элементов списка"
    print $ diffEven testList

    putStrLn "2.Проверка на принадлежность каждого элемента списка разностей исходному списку"
    print $ isDiffInList (diffEven testList) testList

    putStrLn "3.Вычисление длины списка разностей"
    print $ diffLength (diffEven testList)

    putStrLn "4.Вычисление минимальной разности"
    print $ minDiff (diffEven testList)

    putStrLn "5.Вычисление произведений соседних элементов списка"
    print $ multNeighbours testList

    putStrLn "6.Сортировка элементов списка произведений по убыванию"
    print $ sortMult (multNeighbours testList)
    
    putStrLn "7.Сортировка элементов списка разностей по возрастанию"
    print $ sortDiff (diffEven testList)

    where
        -- testList = [0..10]
        testList = [0, 0, 1, 1, 3, 4, 10, 8]

-- 1.Вычисление разности соседних четных элементов списка
diffEven :: [Integer] -> [Integer]
diffEven [] = []
diffEven [x] = []
diffEven (x:y:xs) = if even x && even y then (y - x) : diffEven (y:xs) else diffEven (y:xs)

-- 2.Проверка на принадлежность каждого элемента списка разностей исходному списку
isDiffInList :: [Integer] -> [Integer] -> Bool
isDiffInList [] _ = True
isDiffInList (x:xs) list = if elem x list then isDiffInList xs list else False

-- 3.Вычисление длины списка разностей
diffLength :: [Integer] -> Integer
diffLength [] = 0
diffLength (x:xs) = 1 + diffLength xs

-- 4.Вычисление минимальной разности
minDiff :: [Integer] -> Integer
minDiff [] = error "Error: List is empty"
minDiff [x] = x
minDiff (x:y:xs) = if x < y then minDiff (x:xs) else minDiff (y:xs)

-- 5.Вычисление произведений соседних элементов списка
multNeighbours :: [Integer] -> [Integer]
multNeighbours [] = []
multNeighbours [x] = []
multNeighbours (x:y:xs) = (x * y) : multNeighbours (y:xs)

-- 6.Сортировка элементов списка произведений по убыванию
sortMult :: [Integer] -> [Integer]
sortMult [] = []
sortMult [x] = [x]
sortMult (x:xs) = sortMult [y | y <- xs, y > x] ++ [x] ++ sortMult [y | y <- xs, y <= x]

-- 7.Сортировка элементов списка разностей по возрастанию
sortDiff :: [Integer] -> [Integer]
sortDiff [] = []
sortDiff [x] = [x]
sortDiff (x:xs) = sortDiff [y | y <- xs, y < x] ++ [x] ++ sortDiff [y | y <- xs, y >= x]
