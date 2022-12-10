fibonacci::Integer -> Integer
fibonacci (-2) = -1
fibonacci (-1) = 1
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n | n >  1  = helper 0 1 n
            | n < -2  = helper2 0 1 n

helper acc1 acc2 0 = acc1
helper acc1 acc2 n = helper acc2 (acc1+acc2) (n-1)

helper2 acc1 acc2 0 = acc1
helper2 acc1 acc2 n = helper2 acc2 (acc1-acc2) (n+1) 