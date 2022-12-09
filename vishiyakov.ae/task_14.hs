
-- TASK 14
-- специальный полиморфизм

class Printable a where
	  toString :: a -> String

instance Printable Bool where
	  toString True  = "true"
	  toString False = "false"

instance Printable () where
    toString _ = "unit type" -- _ it is like otherwise


main :: IO()
main = do
    print $ toString True
    print $ toString False
    print $ toString ()
