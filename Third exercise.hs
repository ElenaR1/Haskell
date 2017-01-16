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
compose nullFunc notFunc=(\x->notFunc(nullFunc x))


nullFunc::[]->Bool
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
lengthEncode::[Int]->String
lengthEncode xs=lengthEncodeHelper xs "" 0

lengthEncodeHelper::[Int]->String->Int->String
lengthEncodeHelper (x:xs) str count
  |x==head xs=lengthEncodeHelper xs [x]++str (count + 1)
  |
  |otherwise=
