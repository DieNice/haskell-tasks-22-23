seqA :: Integer -> Integer
seqA 0 = 1
seqA 1 = 2
seqA 2 = 3

seqA n = helper n 1 2 3

helper 0 acc1 acc2 acc3 = acc1
helper n acc1 acc2 acc3 = helper (n-1) acc2 acc3 (acc2 + acc3 - (2*acc1)) 
