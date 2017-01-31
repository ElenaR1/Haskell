--[1,2,3,4,5]->(1+2):(3+4):5:[]=[3,7,5]
sum2::[Int]->[Int]
sum2 []=[]
sum2 [x]=[x]
sum2 (x:y:xs)=(x+y):sum2 xs

--inward ["abcd","efgh","ijkl"]->"abcdlkjiefgh"
--["ab","cd","ef","gh"]="abhgcdfe"
inward::[String]->String
inward []=""
inward [x]=x
inward (x:xs)=x++ reverse (last xs) ++inward (init xs)



--3
f::Int->Int
f a=a*2

g::Int->Int
g a=a*3

--func [f,g] 2->[4,6]
func::(a->a)->(a->a)->a->[a]
func f g x= (f x):(g x):[]

--func2 [f,g] 2->[4,6]
func2::[(a->a)]->a->[a]
func2 [] y=[]
--func2 (x:xs) y=(x y):func2 xs y
func2 xs y=map (\f->f y) xs


func3::[(a->a)]->a->[a]
func3=map(\a f-> f a)

--taka raboti no iskame da nqmame nikakvi argumenti,a taka imame a
func3::a->[(a->a)]->[a]
func3 a=map(\f-> f a)

asdf :: a -> [a -> b] -> [b]
asdf = (zipWith (flip ($))) . repeat

--poslednata zadacha e z sortirane
