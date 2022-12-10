import Text.Printf (printf)

df :: Int -> Int
df 0 = 0
df 1 = 1
df n = n * df (n - 2)

main = do
  printf "7!! = %d\n" (df 7)
