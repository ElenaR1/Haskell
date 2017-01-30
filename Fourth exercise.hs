--Dali duljinata na vseki string = elementa ot drugiq spisuk ["abc","cdef","a"] [3,4,1]-da
func::[String]->[Int]->Bool
func [] []=True
func (x:xs) (y:ys)
  |length x==y=func xs ys
  |otherwise=False



--countOccurences [1,2,4,5,2,3,2] 2->3
countOccurences::(Eq a)=>[a]->a->Int
countOccurences xs a=countOccurencesHelper xs a 0
countOccurencesHelper::(Eq a)=>[a]->a->Int->Int
countOccurencesHelper [] a count =count
countOccurencesHelper (x:xs) a count
  |x==a=countOccurencesHelper xs a (count+1)--
  |otherwise=countOccurencesHelper xs a count
  
countOccurences::(Eq a)=>[a]->a->Int
countOccurences [] elem=0
countOccurences (x:xs) elem
  |x==elem=1+countOccurences xs elem
  |otherwise=countOccurences xs elem


myFilter::(a->Bool)->[a]->[a]
myFilter f []=[]
myFilter f (x:xs)
  |f x==True= x: myFilter f xs  
  |otherwise= myFilter f xs  



type Matrix a=[[a]]
type Column a=[a]
--vzima kolona
nthCol::Matrix Int->Int->Column Int
nthCol [] n=[]
nthCol xs n=map (!!n) xs
--vzima red
type Row a=[a]
nthRow:: Matrix Int->Int->Row Int
--nthRow xs n=xs!!n
nthRow =(!!)

any'::(a->Bool)->[a]->Bool
any' f []=False
any' f (x:xs)
  |f x==True=True
  |f x==False=any' f xs
  

any'::(a->Bool)->[a]->Bool
any' f xs=or(map f xs)
--stava kato kompozicia ot funkcii map vrushta (F,T,T)
or(F,T,T) vrushta True t.k imame pone 1 true


--all
all'::(a->Bool)->[a]->Bool
all' f xs=and(map f xs)

--split
split::[a]->Int->([a],[a])
split xs n=(take  n xs,drop n xs)


--group
group'::(Eq a)=>[a]->[[a]]
group' []=[]
group' (x:xs)=takeWhile (==x) (x:xs) : group' (dropWhile (==x) (x:xs))

--minElement
minElement::(Ord a)=>[a]->a
minElement (x:xs)=minElementHelper xs x
minElementHelper::(Ord a)=>[a]->a->a
minElementHelper[] min=min
minElementHelper (x:xs) min
  |x<min=minElementHelper xs x
  |otherwise=minElementHelper xs min
 --(expr,expr)

minElement::(Ord a)=>[a]->a
minElement (x:xs)=foldl (min) x xs
  
--remove
remove::(Eq a)=>a->[a]->[a]
remove n []=[]
remove n (x:xs)
  |x==n=xs
  |otherwise=x:remove n xs  


--sort
--da polzvam min i remove
minElement::(Ord a)=>[a]->a
minElement (x:xs)=minElementHelper xs x
minElementHelper::(Ord a)=>[a]->a->a
minElementHelper[] min=min
minElementHelper (x:xs) min
  |x<min=minElementHelper xs x
  |otherwise=minElementHelper xs min

  
remove::(Eq a)=>a->[a]->[a]
remove n []=[]
remove n (x:xs)
  |x==n=xs
  |otherwise=x:remove n xs  

sort'::(Ord a)=>[a]->[a]
sort' []=[]
sort' xs=(minElement xs):sort' (remove (minElement xs) xs)

 --(expr,expr)





--16.01
--[1,2,3,4,5]->[[1,2],[3,4],[5]]
lis2::[Int]->[[Int]]
lis2 []=[]
lis2 [x]=[[x]]
--lis2 (x:y:xs)=[x:y:[]]++lis2 xs
--lis2 (x:y:xs)=(x:y:[]):lis2 xs
lis2 xs=[take 2 xs]++lis2 (drop 2 xs)


http://zvon.org/other/haskell/Outputprelude/foldl_f.html
func::[(Int,Int)]->(Int,Int)
func xs=(minimum (map fst xs),maximum (map snd xs))
-- [(1,5), (6, 50)...]->(1,50) minimalnata 1va chast na 2ka i maksimalnata 2ra chast



preff::[a]->[[a]]
preff xs=[take x xs| x<-[1..length xs]]
--[1,2,3]->[[1],[1,2],[1,2,3]]
suff::[a]->[[a]]
suff xs=[drop x xs| x<-[0..length xs-1]]
--[1,2,3]->[[1,2,3],[2,3],[3]]



sublist::(Eq a)=>[a]->[a]->Bool
sublist xs []=False
sublist xs ys=elem xs (preff ys)|| elem xs (suff ys)||sublist xs (tail ys)
--sublist xs ys=
--dali [2,3] e v [1,2,3,4]->true
