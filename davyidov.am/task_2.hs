fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = if n > 0 then fib (n - 1) + fib (n - 2) else -fib (n + 1) + fib (n + 2)

main = do
  print (fib 10)
  print (fib (-10))