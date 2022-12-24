-- Задание:
-- Сделайте тип пары представителем класса типов Printable, реализованного вами в предыдущей задаче. Обеспечив
-- следующее поведение:
--
-- GHCi> toString (False,())
-- "(False,unit type)"
-- GHCi> toString (True,False)


class Printable a where
    toString :: a -> String

instance Printable Bool where
    toString True = "true"
    toString False = "false"

instance Printable () where
    toString () = "unit type"

instance (Printable a, Printable b) => Printable (a, b) where
    toString (a, b) = "(" ++ toString a ++ "," ++ toString b ++ ")"
