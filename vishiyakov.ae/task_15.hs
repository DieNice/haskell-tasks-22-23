
-- TASK 15


class Printable a where
	  toString :: a -> String

instance Printable Bool where
	  toString True  = "true"
	  toString False = "false"

instance Printable () where
	  toString _ = "unit type"

instance (Printable a, Printable b) => Printable (a, b) where
    toString (a, b) = "(" ++ toString a ++ "," ++ toString b ++ ")"


main :: IO()
main = do
    print $ toString (False,())
    print $ toString (True,False)