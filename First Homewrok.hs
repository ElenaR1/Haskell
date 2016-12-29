
 
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


import Test.HUnit
-- Write a function that, given a list and an index, returns the
-- element from the list at the given index
-- Note the type declaration: If there is no element at the given index,
-- return an appropriate value
myListRef :: [Int] -> Int -> Maybe Int
-- Solution goes here
myListRef [] index=Nothing
myListRef xs index
  |index==0= Just (head xs)
  |otherwise= myListRef (tail xs) (index-1)
  {-The Maybe type is defined as follows:
 data Maybe a = Just a | Nothing
     deriving (Eq, Ord)
It allows the programmer to specify something may not be there.
The Maybe type encapsulates an optional value. A value of type Maybe a either contains a value of type a (represented as Just a), or 
it is empty (represented as Nothing). Using Maybe is a good way to deal with errors or exceptional cases without resorting to drastic
measures such as error.-}

-- Test cases
tests = test [ "Try to get the third element of an empty list" ~: "" ~: Nothing ~=? (myListRef [] 2),
               "Get the second element of [2,1]" ~: "" ~: Just 13 ~=? (myListRef [2,13] 1),
               "Get the 42nd element of 1..100" ~: "" ~: Just 42 ~=? (myListRef [1..101] 41),
               "Try to get the -3rd element of a list" ~: "" ~: Nothing ~=? (myListRef [1,2,3] (-3))]



import Test.HUnit
-- Write a function that checks whether given integer is prime
-- Neither 0 nor 1 are prime
prime :: Int -> Bool
prime 1=False
prime 2=True
prime x
  |null [i| i<-[2,3..(x-1)], divides x i]=True
  |otherwise=False
  
divides::Int->Int->Bool
divides x y
  |mod x y==0= True
  |otherwise=False
-- Test Cases
tests = test [ "Test for value 2" ~: "" ~: True ~=? (prime 2),
               "Test for value 6" ~: "" ~: False ~=? (prime 6),
               "Test for value 19231283912" ~: "" ~: False ~=? (prime 19231283912)]


import Test.HUnit
-- Write a function that takes a point (a tuple of integers)
-- and returns the quadrant to which it belongs (in a cartesian coordinate system)
-- (0,0), (0,y), (x,0) do not belong to any quadrant

quadrant :: (Int, Int) -> Maybe Int
-- Solution goes here
quadrant (x,y)
  {--|x==0&&y==0=Nothing
  --|x==0&&y/=0=Nothing
  |x/=0&&y==0=Nothing-}
  
  |x>0&&y>0=Just 1
  |x>0&&y<0=Just 2
  |x<0&&y<0=Just 3
  |x<0&&y>0=Just 4
  |otherwise=Nothing
-- Test Cases
tests = test [ "Check (0,0)" ~: "" ~: Nothing ~=? (quadrant (0,0)),
               "Check for first quadrant" ~: "" ~: Just 1 ~=? (quadrant (12,13)),
               "Check for second quadrant" ~: "" ~: Just 2 ~=? (quadrant (-12, 5)),
               "Check for third quadrant" ~: "" ~: Just 3 ~=? (quadrant (-5, -5)),
               "Check for fourth quadrant" ~: "" ~: Just 4 ~=? (quadrant (5,-12)),
               "Check (0,y)" ~: "" ~: Nothing ~=? (quadrant (0, 2)),
               "Check (x,0)" ~: "" ~: Nothing ~=? (quadrant (2,0))]
