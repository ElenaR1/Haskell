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

asdf :: a -> [a -> b] -> [b]
asdf = (zipWith (flip ($))) . repeat
