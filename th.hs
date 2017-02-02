firstword::String->String
firstword " "=" "
firstword (x:' ':xs)=[x]
firstword (x:y:xs)=x:firstword(y:xs)


tighten::String->String
tighten " "=" "
tighten (' ': xs)=tighten xs
tighten (x:' ':' ':xs)=tighten(x:' ':xs)
tighten (x:' ':y:xs)=x:' ':tighten(y:xs)
tighten (x:xs)=x:tighten xs

type Matrix a=[[a]]
type Column a=[a]

transpose::Matrix a->Matrix a
transpose []=[]
transpose ([]:_)=[]
transpose xs= (map head xs) : transpose (map tail xs)
--transpose xs=foldr (zipWith (:)) (repeat []) xs
--[[1,2,3], [4,5,6],[7,8,9]]
rotate::Matrix a->Matrix a
rotate =reverse.transpose

spiral::Matrix a->Matrix a
spiral []=[]
spiral (x:xs)=[x] ++ spiral (rotate xs)

--spisuk ot podmnojestva
powerset::String->[String]
powerset [] = [[]]
powerset (x:xs) = xss ++ map (x:) xss
  where xss = powerset xs
  
  

fibb::Int->[Int]
fibb n=fibs n  

fib::Int->Int
{-fib n
  
  --guards
  |n==0=0
  |n==1=1
  |n==2=1
  |otherwise=fib(n-1)+fib(n-2)-}
  --pattern matching
fib 0=0
fib 1=1
fib 2=1
fib n=fib(n-1)+fib(n-2)

fibs::Int->[Int]
fibs n=[fib i|i<-[0..n]]
