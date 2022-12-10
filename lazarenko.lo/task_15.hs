-- Задание:
--  Сделайте тип пары представителем класса типов Printable, реализованного вами в предыдущей задаче, обеспечив следующее поведение:
--  GHCi> toString (False,())
--  "(false,unit type)"
--  GHCi> toString (True,False)
--  "(true,false)"

{-# LANGUAGE InstanceSigs #-}
main :: IO()
main = do
    print $ toString (False,())
    print $ toString (True,False)

class Printable a where
    toString :: a -> [Char]
instance Printable Bool where
    toString :: Bool -> [Char]
    toString True = "true"
    toString False = "false"
instance Printable () where
    toString :: () -> [Char]
    toString () = "unit type"
instance (Printable a, Printable b) => Printable (a, b) where
    toString :: (Printable a, Printable b) => (a, b) -> [Char]
    toString (a, b) = "(" ++ toString a ++ "," ++ toString b ++ ")" 