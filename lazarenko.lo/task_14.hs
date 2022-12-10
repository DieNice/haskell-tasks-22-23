-- Задание:
--  Реализуйте класс типов Printable, предоставляющий один метод toString - функцию одной переменной, 
--  которая преобразует значение типа, являющегося представителем Printable, в строковое представление.
--  Сделайте типы данных Bool и () представителями этого класса типов, обеспечив следующее поведение:
--  GHCi> toString True
--  "true"
--  GHCi> toString False
--  "false"
--  GHCi> toString ()
--  "unit type"

-- Проверяем работоспособность на ситуациях из примеров к заданию (ожидаемой работы функций)
{-# LANGUAGE InstanceSigs #-}
main :: IO()
main = do
    print $ toString True
    print $ toString False
    print $ toString ()

class Printable a where
    toString :: a -> [Char]
instance Printable Bool where
    toString :: Bool -> [Char]
    toString True = "true"
    toString False = "false"
instance Printable () where
    toString :: () -> [Char]
    toString () = "unit type"