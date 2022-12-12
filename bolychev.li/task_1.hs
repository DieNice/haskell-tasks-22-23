doublefact::Integer -> Integer
doublefact 0 = 1
doublefact 1 = 1
doublefact x=x*doublefact(x-2)
