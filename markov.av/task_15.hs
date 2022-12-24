-- Сделать тип пары представителем класса типов
-- Printable, реализованного в предыдущей задаче,
-- обеспечив следующее поведение:
-- * toString (False, ()) -> (false, unit type)
-- * toString (True, False) -> (true, false)

class Printable a where
    toString :: a -> String

instance Printable Bool where
    toString a = if a then "true" else "false"

instance Printable () where
    toString () = "unit type"

instance (Printable a, Printable b) => Printable (a, b) where
    toString (a, b) = "(" ++ toString a ++ ", " ++ toString b ++ ")" 



main = do
    print (toString True)
    print (toString False)
    print (toString ())
    print (toString (False, ()))
    print (toString (True, False))