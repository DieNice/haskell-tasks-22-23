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


main :: IO ()
main = do
    -- К каждому элементу списка прибавить заданное число.
    print $ plusNum 4 numbers

    -- Каждый элемент списка умножить на заданное число.
    print $ multiplyNum 2 numbers

    -- по исходному списку сформировать список пар, где вторым элементом списка является заданное число.
    print $ listTuples 0 numbers

    -- Из исходного списка сформировать список списков;
    print $ listLists numbers

    -- Из исходного списка сформировать список пар, где первый элемент каждой пары равен соответствующему элементу исходного списка, 
    --  а второй равен числу вхождений этого элемента в исходный список;
    print $ newListTuples numbers

    -- Из исходного списка сформировать список, в котором каждый элемент равен разности между соседними элементами исходного списка;
    print $ listWithoutLast numbers sumNeighbors

    -- Из исходного списка сформировать список, в котором каждый элемент равен сумме соседних элементов исходного списка.
    print $ listWithoutLast numbers diffNeighbors

    where
        numbers :: [Integer]
        numbers = [0, 10, 3, 25, 15, 84, 1, 0]

plusNum :: Num b => b -> [b] -> [b]
plusNum num = map (+ num)

multiplyNum :: Num b => b -> [b] -> [b]
multiplyNum num = map (* num)

listTuples :: b -> [a] -> [(a, b)]
listTuples num arr = [(z, num) | z<-arr]

listLists :: [a] -> [[a]]
listLists arr = [[x] | x<-arr]

newListTuples :: Eq a => [a] -> [(a, Int)]
newListTuples arr = [(x, count x arr) | x<-arr]

count :: (Eq a) => a -> [a] -> Int
count w = length . filter (==w)

-- функция нужна чтобы не выводить последний элемент при сумме/разности пар (т.к. происходит операция с самим собой)
listWithoutLast :: t -> (t -> [a]) -> [a]
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