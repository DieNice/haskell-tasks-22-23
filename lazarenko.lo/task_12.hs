-- Реализовать функцию, находящую сумму
-- и количество цифр десятичной записи
-- заданного целого числа

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = (summarize 0 (abs x), if x == 0 then 1 else count 0 (abs x))
                    where
                        count counter 0 = counter
                        count counter x = count (counter + 1) (x `div` 10)
                        summarize sum 0 = sum
                        summarize sum x = summarize (sum + x `mod` 10) (x `div` 10)

main = do
    print (sum'n'count 0)
    print (sum'n'count 1)
    print (sum'n'count 100)
    print (sum'n'count (-50))
