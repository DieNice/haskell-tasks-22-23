-- Индивидуальное доп. задание: реализовать Functor для Tree

{-# LANGUAGE InstanceSigs #-}
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

main :: IO ()
main = do
    print $ fmap (+ 1) (Leaf 5)
    print $ fmap (+ 1) (Node (Leaf 5) 6 (Leaf 7))
    print $ fmap (+ 1) (Node (Node (Leaf 5) 6 (Leaf 7)) 8 (Leaf 9))

instance Functor Tree where
    fmap :: (a -> b) -> Tree a -> Tree b
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Node left a right) = Node (fmap f left) (f a) (fmap f right)