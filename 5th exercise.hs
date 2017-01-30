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
