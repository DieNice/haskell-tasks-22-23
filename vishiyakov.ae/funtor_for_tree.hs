

data Tree =  Leaf a | Node (Tree a) a (Tree a)


instance Functor Tree where
  fmap f Leaf = Leaf (f a)
  fmap f (Node h l1 l2) = Node (f h) (fmap l1) (fmap l2)
  


main :: IO ()
main = do
    print "hello"


