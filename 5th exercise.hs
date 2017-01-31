18.01
permutations::(Eq a) => [a]->[[a]]
permutations[]=[[]]
--permutations[x]=[[x]]
--permutations [x,y]=[[x,y],[y,x]]
permutations xs=[i:j|i<-xs,j<-permutations(delete xs i)]
--[x:ys|x<-xs,ys<-perm(deletex xs)]
delete::(Eq a)=>[a]->a->[a]
delete [] z=[]
delete (x:xs) z
  |x==z=xs
  |otherwise=x:delete xs z
 
grayCode::Int->[[Int]]
grayCode 0=[[]]
grayCode x=(map (0:) lessGray)++ (map (1:) lessGray)
  where lessGray=grayCode(x-1)


--GoldBach Every even integer greater than 2 can be expressed as the sum of two primes.[
prime::Int->Bool
prime 1=False
prime 2=True
prime x
  |null [i|i<-[2,3..x-1],divides x i]=True
  |otherwise=False
  
divides::Int->Int->Bool
divides x y
  |x`mod` y==0=True
  |otherwise=False
  
  
--returns a list of prime numbers 
generatePrimes::Int->[Int]
generatePrimes max=[i|i<-[2..max],prime i]

--or we can do this in this way but it doesn't work
--primeToList::Int->[Int]
--primeToList max=primeToListHelper max 1 []

--primeToListHelper::Int->Int->[Int]->[Int]
--primeToListHelper max start resultList
--  |start>max=resultList
--  |prime start==True=primeToListHelper max (start+1) start:resultList
--  |otherwise=primeToListHelper max (start+1) resultList
  
goldhelp::Int->[(Int,Int)]
goldhelp n = [(x,y) | x <- pr, y <- pr, x+y==n] 
  where pr=generatePrimes n
  
