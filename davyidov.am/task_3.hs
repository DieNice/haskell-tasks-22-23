fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n
  | n > 1 = helper 0 1 n
  | n < 0 = (-1) ^ ((-n) + 1) * helper 0 1 (-n) 

helper :: Integer -> Integer -> Integer -> Integer
helper x y 0 = x
helper x y n = helper y (x + y) (n - 1)

main = do
  print (fib 100)
  print (fib (-100))