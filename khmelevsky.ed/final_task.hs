import Control.Exception ()
import Prelude hiding (compare)
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
    print $ diffEven testList1

    -- === ТЕСТЫ ===
    -- Логика вычитания соседей: Из второго эл-та вычитается предыдущий
    -- Тест: Есть отрицательные числа
    -- Ожидаемый результат: [4 - 4, 0 - 4, -2 - 0, -4 - 2] 
    print $ assertList [0, -4, -2, -2] (diffEven testList1)
    -- Тест: Нет отрицательных чисел
    -- Ожидаемый результат: [0 - 0, 10 - 4, 8 - 10] 
    print $ assertList [0, 6, -2] (diffEven testList2)
    -- Тест: нет чётных соседей
    print $ assertList [] (diffEven testList3)
    -- Тест: пустой список
    print $ assertList [] (diffEven testEmpty)
    -- Тест: 1 эл-т в списке
    print $ assertList [] (diffEven testOneEl)

    -- ======

    putStrLn "2.Проверка на принадлежность каждого элемента списка разностей исходному списку"
    print $ isDiffInList (diffEven testList1) testList1

    -- === ТЕСТЫ ===
    -- Тест: Все элементы есть в исходном списке
    -- Исходный список: [1, 2, 3, 4, 4, 0, -2, -4, 1, 1, 5]
    -- Список разности: [0,-4,-2,-2]
    print $ assertBool True (isDiffInList (diffEven testList1) testList1)
    -- Тест: Не все эл-ты есть в исходном списке (6 и -2 нет в исходном списке)
    -- Исходный список: [0, 0, 1, 1, 3, 4, 10, 8]
    -- Список разности: [0, 6, -2]
    print $ assertBool False (isDiffInList (diffEven testList2) testList2)
    -- Тест: Все эл-ты есть в исходном списке (список пустой)
    -- Исходный список: []
    -- Список разности: []
    print $ assertBool True (isDiffInList (diffEven testEmpty) testEmpty)

    -- ======

    putStrLn "3.Вычисление длины списка разностей"
    print $ diffLength (diffEven testList1)

    -- === ТЕСТЫ ===
    -- Тест: чётный список
    -- Список разности: [0,-4,-2,-2]
    print $ assertNum 4 (diffLength (diffEven testList1))
    -- Тест: не чётный список
    -- Список разности: [0, 6, -2] 
    print $ assertNum 3 (diffLength (diffEven testList2))
    -- Тест: пустой список
    -- Список разности: [] 
    print $ assertNum 0 (diffLength (diffEven testList3))

    -- ======

    putStrLn "4.Вычисление минимальной разности"
    print $ minDiff (diffEven testList1)

    -- === ТЕСТЫ ===
    -- Тест: список не пуст
    -- Список разности: [0,-4,-2,-2]
    print $ assertNum (-4) (minDiff (diffEven testList1))
    -- Тест: список не пуст
    -- Список разности: [0, 6, -2] 
    print $ assertNum (-2) (minDiff (diffEven testList2))
    -- Тест: список пуст
    -- Список разности: [] 
    -- Резуьтат: Выкинется исключение функции
    -- print $ assertNum 0 (minDiff (diffEven testList3))

    -- =======

    putStrLn "5.Вычисление произведений соседних элементов списка"
    print $ multNeighbours testList1

    -- === ТЕСТЫ ===
    -- Тест: список содержит отрицательные числа
    -- Исходный список: [1, 2, 3, 4, 4, 0, -2, -4, 1, 1, 5]
    -- Ожидаемый результат: [1*2, 2*3, 3*4, 4*4, 4*0, 0*(-2), -2*(-4), -4*1, 1*1, 1*5]
    print $ assertList [2,6,12,16,0,0,8,-4,1,5] (multNeighbours testList1)
    -- Тест: список не содержит отрицательные числа
    -- Исходный список: [0, 0, 1, 1, 3, 4, 10, 8]
    -- Ожидаемы результат: [0*0, 0*1, 1*1, 1*3, 3*4, 4*10, 10*8]
    print $ assertList [2,6,12,16,0,0,8,-4,1,5] (multNeighbours testList2)
    -- Тест: в списке 1 элемент
    -- Исходный список: [1]
    -- Ожидаемы результат: []
    print $ assertList [] (multNeighbours testOneEl)
    -- Тест: Список пуст
    -- Исходный список: []
    -- Ожидаемы результат: []
    print $ assertList [] (multNeighbours testOneEl)

    -- =======

    putStrLn "6.Сортировка элементов списка произведений по убыванию"
    print $ sortMult (multNeighbours testList1)

    -- === ТЕСТЫ ===
    -- Тест: Есть отрицательные числа и 0 (все числа в разнобой)
    -- Список произведений: [2, 6, 12, 16, 0, 0, 8, -4, 1, 5]
    print $ assertList [16,12,8,6,5,2,1,0,0,-4] (sortMult (multNeighbours testList1))
    -- Тест: Список упорядочен по возрастанию
    -- Список произведений: [0, 0, 1, 3, 12, 40, 80]
    print $ assertList [80,40,12,3,1,0,0] (sortMult (multNeighbours testList2))
    -- Тест: Пустой список
    -- Список произведений: []
    print $ assertList [] (sortMult (multNeighbours testEmpty))
    
    -- =======

    putStrLn "7.Сортировка элементов списка разностей по возрастанию"
    print $ sortDiff (diffEven testList1)

    -- === ТЕСТЫ ===
    -- Тест: Не упорядоченный список разностей
    -- Список разности: [0,-4,-2,-2]
    print $ assertList [-4,-2,-2,0] (sortDiff (diffEven testList1))
    -- Тест: Упорядоченный список разностей
    -- Список разности: [0, 2, 6]
    print $ assertNum [0, 2, 6] (sortDiff (diffEven testList4))
    -- Тест: Пустой список
    -- Список разности: []
    print $ assertNum [] (sortDiff (diffEven testEmpty))
    
    -- =======

    where
        -- test cases
        testList1 = [1, 2, 3, 4, 4, 0, -2, -4, 1, 1, 5]
        testList2 = [0, 0, 1, 1, 3, 4, 10, 8]
        testList3 = [0..10]
        testList4 = [0, 0, 1, 1, 3, 2, 4, 10]
        testEmpty = []
        testOneEl = [1]

-- === ТЕСТЫ ===

-- Сравнение списков
compare :: Eq a => [a] -> [a] -> Bool
compare (x:xs) (y:ys) = (x == y) && compare xs ys
compare [] [] = True
compare [] _ = False
compare _ [] = False

-- Равенство списков
assertList :: [Integer] -> [Integer] -> [Char]
assertList arr1 arr2 = if compare arr1 arr2 then "Test passed" else "Test failed"

-- Равенство bool
assertBool :: Bool -> Bool -> [Char]
assertBool True True = "Test passed"
assertBool False False = "Test passed"
assertBool _ _ = "Test failed"

-- Равенство Чисел
assertNum :: Eq a => a -> a -> [Char]
assertNum a b = if a == b then "Test passed" else "Test failed"

-- ======

-- === ПАКЕТ МЕТОДОВ РАБОТЫ СО СПИСКАМИ ===

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

-- ======