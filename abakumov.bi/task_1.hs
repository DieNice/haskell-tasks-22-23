doubleFact :: Integer -> Integer
doubleFact x = if x <= 0 then 1 else x * doubleFact(x - 2)

main = do 
    print(doubleFact 4)
    print(doubleFact 5)
    print(doubleFact 6)
    print(doubleFact 7)
    print(doubleFact 8)
    print(doubleFact 9)