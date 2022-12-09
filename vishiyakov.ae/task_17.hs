
-- TASK 17

data Point3D a = Point3D a a a deriving Show
instance Functor Point3D where
   fmap f (Point3D x y z) = Point3D (f x) (f y) (f z)


--Определите представителя класса Functor для типа данных GeomPrimitive, который определён следующим образом:
data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a) deriving Show
instance Functor GeomPrimitive where
    fmap f (Point p) = Point (fmap f p)
    fmap f (LineSegment p1 p2) = LineSegment (fmap f p1) (fmap f p2)


main :: IO()
main = do
    print $ fmap (+ 1) (Point3D 5 6 7)
    print $ fmap (+ 1) (LineSegment (Point3D 0 0 0) (Point3D 1 1 1))
