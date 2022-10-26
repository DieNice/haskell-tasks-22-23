-- Задание:
--  Задан список латинских слов. Упорядочить по алфавиту.

main :: IO()
main = do
    print $ isort strings
    where
        strings = ["sweet", "hulu", "orange", "aloha"]

isort :: [String] -> [String]
isort [] = []
isort (x:xs) = insert x (isort xs)

insert :: String -> [String] -> [String]
insert x [] = [x]
insert x (y:ys)
    |x <= y    = x:y:ys
    |otherwise = y:insert x ys