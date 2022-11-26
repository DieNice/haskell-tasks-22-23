--Задание:
--  Задан список латинских слов. Упорядочить по алфавиту.
import Data.List
import Data.Function
 
testData :: [String]
testData = ["BB", "Bb", "bB", "bb", "AA", "Aa", "aA", "aa", "AAA"]
           
 
main :: IO ()
main = do
    let third (x) = x
        cond f = f `on` third 
    print  $ sortBy (cond compare) testData 





