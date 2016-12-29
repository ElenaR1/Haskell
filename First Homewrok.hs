increasing :: [Int]->Bool
increasing []=True
increasing(x:[])=True
increasing(x:y:[])=x<y
increasing(x:y:xs)
  |x<y=increasing(y:xs)
  |otherwise=False
  

  
{-increasing xs= if xs==[]
  then True
 else if tail xs==[]
  then True
 else if head xs<=head(tail xs)
then increasing (tail xs)
 else False-}
 
 
 {-watch::Int->[Char]
 watch n
  |n==7= "it's 7 o'clock"
  |otherwise= show n++ " o'clock and all's wel"-}
  
 len::[a]->Int
 len []=0
 len (x:xs)=1+len xs
 
 summ::[Int]->Int
 summ []=0
 summ (x:xs)=x+ sum xs
 
 maximumm::[Int]->Int
 maximumm [x]=x
 maximumm (x:xs)
   |x>mx=x
   |otherwise=mx
   where mx=maximumm xs


import Test.HUnit

-- Write a function that checks whether the elements in a given list of integers
-- are in descending order
-- Pattern matching will help A LOT
descending :: [Int] -> Bool
-- Solution goes here
descending []=True
descending(x:[])=True
descending(x:y:[])=x>y
descending(x:y:xs)
  |x>y=descending(y:xs)
  |otherwise=False
-- Test cases
tests = test [ "Empty list" ~: "" ~: True ~=? (descending []),
               "A singleton list" ~: "" ~: True ~=? (descending [2]),
               "A list with two elements" ~: "" ~: True ~=? (descending [2,1]),
               "A list in ascending order" ~: "" ~: False ~=? (descending [1,2,3]),
               "A bigger list in descending order" ~: "" ~: True ~=? (descending [101,100..1])]

			   increasing :: [Int]->Bool
{-increasing []=True
increasing(x:[])=True
increasing(x:y:[])=x<y
increasing(x:y:xs)
  |x<y=increasing(y:xs)
  |otherwise=False
  
  
  
increasing xs= if xs==[]
  then True
 else if tail xs==[]
  then True
 else if head xs<=head(tail xs)
then increasing (tail xs)
 else False-}
