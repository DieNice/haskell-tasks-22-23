-- Задание: Определить представителя класса Functor для типа данных, представляющего точку в трёхмерном пространстве
{-# LANGUAGE InstanceSigs #-}
data Point3D a = Point3D a a a deriving Show

-- Проверяем работоспособность на ситуации из примера к заданию
main :: IO()
main = do
    print $ fmap (+ 1) (Point3D 5 6 7)

instance Functor Point3D where
   fmap :: (a -> b) -> Point3D a -> Point3D b
   fmap f (Point3D a b c) = Point3D (f a) (f b) (f c)