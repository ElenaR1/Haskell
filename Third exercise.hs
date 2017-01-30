twice::(a->a)->a->a
twice f x=twicehelper f x 2--ili = f (f x)

twicehelper::(a->a)->a->Int->a
twicehelper f x n
  |n==0=x
  |otherwise= twicehelper f (f x) (n - 1)
  
callntimes::Int->(a->a)->a->a
callntimes n f x
  |n==0=x
  |otherwise=callntimes (n - 1) f (f x)

f::Int->Int
f x = x + 3


-- moje v konzolata  twice (\ x->x+3) 2

--2
compose::(a->a)->(a->a)->(a->a)
compose f1 f2 = (\x->f1(f2 x))

--or:
compose::(a->a)->(b->a)->(b->a)--v tetradkata
compose nullFunc notFunc=(\x->notFunc(nullFunc x))//trqbva da e compose notFunc nullFunc


nullFunc::[a]->Bool
nullFunc xs
  |null xs=True
  |otherwise=False
  
notFunc::Bool->Bool
notFunc pred
  |pred==True=False
  |pred==False=True


--taka moga da go testvam 
compose::(a->a)->(b->a)->(b->a)
compose f g x=(f(g x))


nullFunc::[a]->Bool
nullFunc xs
  |null xs=True
  |otherwise=False
  
notFunc::Bool->Bool
notFunc pred
  |pred==True=False
  |pred==False=True



f1::Int->Int
f1 x = x + 3

f2::Int->Int
f2 x= 2*xf2 x= 2*x

--compose::(d->b)->(c->d)->(c->b)


--3
lengthEncode1::[Char]->[Char]
lengthEncode1 []=[]
lengthEncode1 (x:xs)='length(takeWhile (== x) (x:xs))' : x :l engthEncode1 (dropWhile (== x) (x:xs))

lengthEncode::[Char]->[(Char,Int)]
lengthEncode []=[]
lengthEncode xs=(head xs,length(takeWhile (==(head xs)) xs)):lengthEncode (dropWhile (==(head xs)) xs)

-- ???
lengthEncode2::[Char]->[(Char,Int)]
lengthEncode2 []=[]
lengthEncode2 (x:xs)=(x,length(takeWhile (==x) (x:xs))):lengthEncode2 (dropWhile (==x) (x:xs))

