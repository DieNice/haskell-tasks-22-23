fibonacci::Integer -> Integer
fibonacci (-2) = -1
fibonacci (-1) = 1
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n | n >  1  = fibonacci (n-1) + fibonacci (n-2)
            | n < -2  = fibonacci (n+2) - fibonacci (n+1)
