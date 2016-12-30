import Test.HUnit
-- Write a function that duplicates every element in a given list.
-- Take a look at the tests for reference.
duplicate::[a]->[a]
duplicate[]=[]
duplicate(x:xs)=x:x:duplicate xs--xs =tail
 
-- Test Cases
-- add more if you wish
tests = test [ "Test for value [1,2,3]" ~: "" ~: [1,1,2,2,3,3] ~=? (duplicate [1,2,3]),
               "Test for value [a]" ~: "" ~: ['a', 'a'] ~=? (duplicate ['a'])]
 
 
 
 import Test.HUnit;
-- Hey yo! Write a function that calculates the x^n by given x and n.
-- Make sure it's fast.
-- x*x*x...*x n times is not fast.
fastExpt::Int->Int->Int
fastExpt x n
  |n==0=1
  |n==1=x
 -- |otherwise=x* fastExpt x (n-1)
  |n `mod` 2==0=fastExpt (x*x) (n `div` 2)--ako n e chetno
  |otherwise=x*fastExpt x (n-1)
-- Test Cases
-- Add more if you wish
tests = test [ "2^3" ~: "" ~: 8 ~=? (fastExpt 2 3),
               "_^0" ~: "" ~: 1 ~=? (fastExpt 21392112 0),
               "4^3" ~: "" ~: 64 ~=? (fastExpt 4 3)]
               
               
import Test.HUnit
-- Ahoy! Write a function that returns the n-th fibonacci number
-- By given n. Give it a try using pattern matching.
-- Give it another try using guards.
-- Indexing starts at 0.
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
-- Test Cases
-- add more if you wish
tests = test [ "Test for value 2" ~: "" ~: 0 ~=? (fib 0),
               "Test for value 2" ~: "" ~: 1 ~=? (fib 2),
               "Test for value 15" ~: "" ~: 610 ~=? (fib 15)]
               
               
-- Hey yo. Write a function that, given a string and a shift value,
-- returns a new string with all of its characters shifted by the given value.
-- Example:
-- caesarEncode "abc" 2 -> "cde"
-- caesarEncode "blah" 1 -> "cmbi"
-- What are you going to do if the shift value is greater than the alphabet length?
-- For the sake of simplicity, we will work only with lowercase letters from the
-- english alphabet
 
alphabet :: String
alphabet = ['a'..'z']
nextChar::Char->Char
nextChar ' '=' '
nextChar 'z'='a'
nextChar x=head (tail lst)
  where lst=[x..'z']--definiram neshto koeto izpolzvam samo v tazi f-q
  
shiftCharBy::Char->Int->Char
shiftCharBy x 0=x
shiftCharBy x 1=nextChar x
shiftCharBy x n=shiftCharBy (nextChar x) (n-1)

caesarEncode::String->Int->String
caesarEncode [] n=[]
caesarEncode (x:xs) n =(shiftCharBy x n):caesarEncode xs n


prevCharHelper::Char -> String -> Char
prevCharHelper a (x:xs)
  |a==head xs=x
  |otherwise=prevCharHelper a xs


previousChar::Char->Char
previousChar ' '=' '
previousChar 'a'='z'
previousChar x=prevCharHelper x ['a'..x]

shiftCarBy::Char->Int->Char
shiftCarBy x 0=x
shiftCarBy x 1=previousChar x
shiftCarBy x n=shiftCarBy (previousChar x) (n-1) 
{-
--zashto ne stava da bude i s otricatelno n
shiftCarBy x n
  |n>0=shiftCarBy (previousChar x) (n-1) 
  |otherwise=shiftCarBy x n=shiftCarBy (previousChar x) (n+1)-}

caesarDecode::String->Int->String
caesarDecode [] n=[]--vmesto [] " "
--caesarDecode " " n=" "--vmesto [] " "
caesarDecode (x:xs) n=(shiftCarBy x n):caesarDecode xs n
