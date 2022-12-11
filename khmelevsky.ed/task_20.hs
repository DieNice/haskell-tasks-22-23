import Control.Exception (assert)
-- ==Задание==
-- Использовать функции высших порядков при решении следующих задач (filter, map, reduce и т.д.):
--  + К каждому элементу списка прибавить заданное число.
--  + Каждый элемент списка умножить на заданное число.
--  + по исходному списку сформировать список пар, где вторым элементом списка является заданное число.
--  + Из исходного списка сформировать список списков;
--  + Из исходного списка сформировать список пар, где первый элемент каждой пары равен соответствующему элементу исходного списка, 
--      а второй равен числу вхождений этого элемента в исходный список;
--  + Из исходного списка сформировать список, в котором каждый элемент равен разности между соседними элементами исходного списка;
--  + Из исходного списка сформировать список, в котором каждый элемент равен сумме соседних элементов исходного списка.

-- Точно не уверен, но наверное в этом задании список имеет какой-то такой вид: [Integer]

-- Не везде удалось придумать функции с применением функций высших порядков, но постарался использовать их везде по максимуму
-- тот же $ вроде как считается тоже функцией высшего порядка, а он у меня используется везде при выводе :D

main :: IO ()
main = do
    -- 1. К каждому элементу списка прибавить заданное число.
    -- print $ plusNum 4 numbers
    putStrLn "Test plusNum (+4):"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [4, 14, 7, 29, 19, 88, 5, 4, -1]"
    print $ assert (plusNum 4 numbers == [4, 14, 7, 29, 19, 88, 5, 4, -1]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (plusNum 4 [] == []) "Test passed"
    putStrLn ""

    putStrLn "Входной список: [1]"
    putStrLn "Ожидаемый результат: [5]"
    print $ assert (plusNum 4 [1] == [5]) "Test passed"
    putStrLn ""

    -- 2. Каждый элемент списка умножить на заданное число.
    -- [0, 10, 3, 25, 15, 84, 1, 0, -5]
    -- print $ multiplyNum 2 numbers

    putStrLn "Test multiplyNum (*2):"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [0, 20, 6, 50, 30, 168, 2, 0, -10]"
    print $ assert (multiplyNum 2 numbers == [0, 20, 6, 50, 30, 168, 2, 0, -10]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (multiplyNum 2 [] == []) "Test passed"
    putStrLn ""

    -- 3. по исходному списку сформировать список пар, где вторым элементом списка является заданное число.
    -- print $ listTuples 0 numbers

    putStrLn "Test listTuples (0):"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [(0, 0), (10, 0), (3, 0), (25, 0), (15, 0), (84, 0), (1, 0), (0, 0), (-5, 0)]"
    print $ assert (listTuples 0 numbers == [(0, 0), (10, 0), (3, 0), (25, 0), (15, 0), (84, 0), (1, 0), (0, 0), (-5, 0)]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (null (listTuples 0 [])) "Test passed"
    putStrLn ""

    -- 4. Из исходного списка сформировать список списков;
    -- print $ listLists numbers

    putStrLn "Test listLists:"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [[0], [10], [3], [25], [15], [84], [1], [0], [-5]]"
    print $ assert (listLists numbers == [[0], [10], [3], [25], [15], [84], [1], [0], [-5]]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (null (listLists [])) "Test passed"
    putStrLn ""

    -- 5. Из исходного списка сформировать список пар, где первый элемент каждой пары равен соответствующему элементу исходного списка, 
    --  а второй равен числу вхождений этого элемента в исходный список;
    -- print $ newListTuples numbers

    putStrLn "Test newListTuples:"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [(0, 2), (10, 1), (3, 1), (25, 1), (15, 1), (84, 1), (1, 1), (0, 2), (-5, 1)]"
    print $ assert (newListTuples numbers == [(0, 2), (10, 1), (3, 1), (25, 1), (15, 1), (84, 1), (1, 1), (0, 2), (-5, 1)]) "Test passed"
    putStrLn ""

    -- Тут assert не нужен, выкинется ошибка функции
    -- print $ newListTuples [()]

    -- 6. Из исходного списка сформировать список, в котором каждый элемент равен сумме между соседними элементами исходного списка;
    -- print $ listWithoutLast numbers sumNeighbors

    putStrLn "Test listWithoutLast (sumNeighbors):"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [10, 13, 28, 40, 99, 85, 1, -5]"
    print $ assert (listWithoutLast numbers sumNeighbors == [10, 13, 28, 40, 99, 85, 1, -5]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (listWithoutLast [] sumNeighbors == []) "Test passed"
    putStrLn ""

    putStrLn "Входной список: [1]"
    putStrLn "Ожидаемый результат: []"
    print $ assert (listWithoutLast [1] sumNeighbors == []) "Test passed"
    putStrLn ""

    -- Из исходного списка сформировать список, в котором каждый элемент равен разности соседних элементов исходного списка.
    -- print $ listWithoutLast numbers diffNeighbors
    putStrLn "Test listWithoutLast (diffNeighbors):"
    putStrLn "Входной список: [0, 10, 3, 25, 15, 84, 1, 0, -5]"
    putStrLn "Ожидаемый результат: [-10, 7, -22, 10, -69, 83, 1, 5]"
    print $ assert (listWithoutLast numbers diffNeighbors == [-10, 7, -22, 10, -69, 83, 1, 5]) "Test passed"
    putStrLn ""

    putStrLn "Входной список: []"
    putStrLn "Ожидаемый результат: []"
    print $ assert (listWithoutLast [] diffNeighbors == []) "Test passed"
    putStrLn ""

    putStrLn "Входной список: [1]"
    putStrLn "Ожидаемый результат: []"
    print $ assert (listWithoutLast [1] diffNeighbors == []) "Test passed"
    putStrLn ""

    where
        numbers :: [Integer]
        numbers = [0, 10, 3, 25, 15, 84, 1, 0, -5]

plusNum :: Num b => b -> [b] -> [b]
plusNum num = map (+ num)

multiplyNum :: Num b => b -> [b] -> [b]
multiplyNum num = map (* num)

listTuples :: b -> [a] -> [(a, b)]
listTuples num arr = [(z, num) | z<-arr]

listLists :: [a] -> [[a]]
listLists arr = [[x] | x<-arr]

newListTuples :: (Eq a) => [a] -> [(a, Int)]
newListTuples [] = error "List empty"
newListTuples arr = [(x, count x arr) | x<-arr]

count :: (Eq a) => a -> [a] -> Int
count w = length . filter (==w)

-- функция нужна чтобы не выводить последний элемент при сумме/разности пар (т.к. происходит операция с самим собой)
-- listWithoutLast :: t -> (t -> [a]) -> [a]
listWithoutLast :: [a1] -> ([a1] -> [a2]) -> [a2]
listWithoutLast [] _ = []
listWithoutLast x f = init (f x)

sumNeighbors :: Num a => [a] -> [a]
sumNeighbors [ ] = []
sumNeighbors [x] = [x + x]
sumNeighbors  x  = (head x + secondElement x) : sumNeighbors (tail x)

diffNeighbors :: Num a => [a] -> [a]
diffNeighbors [ ] = []
diffNeighbors [x] = [x - x]
diffNeighbors  x  = (head x - secondElement x) : diffNeighbors (tail x)

secondElement :: [a] -> a
secondElement = head . tail